package com.likhithpraveenk.storii

import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.support.v4.media.MediaBrowserCompat
import android.support.v4.media.MediaMetadataCompat
import android.support.v4.media.session.MediaControllerCompat
import android.support.v4.media.session.PlaybackStateCompat
import android.widget.Toast
import com.ryanheise.audioservice.AudioService
import com.ryanheise.audioservice.AudioServicePlugin
import java.util.concurrent.atomic.AtomicBoolean


class WidgetPlayReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val libraryItemId = intent.getStringExtra(EXTRA_LIBRARY_ITEM_ID) ?: return
        val episodeId = intent.getStringExtra(EXTRA_EPISODE_ID)

        val appContext = context.applicationContext
        val engine = AudioServicePlugin.getFlutterEngine(appContext)
        WidgetChannelHandler.attachTo(appContext, engine.dartExecutor.binaryMessenger)

        val pending = goAsync()
        val handler = Handler(Looper.getMainLooper())
        val finished = AtomicBoolean(false)

        lateinit var browser: MediaBrowserCompat

        fun finishOnce() {
            if (!finished.compareAndSet(false, true)) return
            runCatching { browser.disconnect() }
            runCatching { pending.finish() }
        }

        fun queuePlay() {
            showPreparingToast(appContext)
            WidgetChannelHandler.queuePendingPlay(appContext, libraryItemId, episodeId)
            WidgetChannelHandler.notifyPendingPlay()
            finishOnce()
        }

        browser = MediaBrowserCompat(
            appContext,
            ComponentName(appContext, AudioService::class.java),
            object : MediaBrowserCompat.ConnectionCallback() {

                override fun onConnected() {
                    val controller = runCatching {
                        MediaControllerCompat(appContext, browser.sessionToken)
                    }.getOrNull()

                    if (controller == null) {
                        queuePlay()
                        return
                    }

                    val state = controller.playbackState?.state
                    val sameItem = matches(controller.metadata, libraryItemId, episodeId)

                    if (sameItem) {
                        when (state) {
                            PlaybackStateCompat.STATE_PLAYING,
                            PlaybackStateCompat.STATE_BUFFERING,
                            PlaybackStateCompat.STATE_CONNECTING,
                                -> controller.transportControls.pause()

                            PlaybackStateCompat.STATE_PAUSED -> controller.transportControls.play()

                            else -> queuePlay()
                        }
                    } else {
                        queuePlay()
                    }

                    finishOnce()
                }

                override fun onConnectionFailed() = finishOnce()
                override fun onConnectionSuspended() = finishOnce()
            },
            null,
        )

        handler.postDelayed({ finishOnce() }, TOTAL_BUDGET_MS)

        runCatching { browser.connect() }.onFailure { finishOnce() }
    }

    private fun matches(
        metadata: MediaMetadataCompat?,
        itemId: String,
        episodeId: String?,
    ): Boolean {
        val itemIdFromMedia = metadata?.getString("itemId")
        val episodeIdFromMedia = metadata?.getString("episodeId")
        return itemId == itemIdFromMedia && episodeId == episodeIdFromMedia
    }

    private fun showPreparingToast(context: Context) {
        Toast.makeText(
            context, context.getString(R.string.widget_preparing_playback), Toast.LENGTH_LONG
        ).show()
    }

    companion object {
        const val EXTRA_LIBRARY_ITEM_ID = "extra_library_item_id"
        const val EXTRA_EPISODE_ID = "extra_episode_id"
        private const val TOTAL_BUDGET_MS = 9_000L
    }
}
