package com.likhithpraveenk.storii

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.core.content.edit
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors


class WidgetChannelHandler(context: Context) : MethodChannel.MethodCallHandler {

    private val appContext = context.applicationContext
    private val mainHandler = Handler(Looper.getMainLooper())
    private val executor: ExecutorService = Executors.newSingleThreadExecutor()
    private var channel: MethodChannel? = null
    private var currentMessenger: BinaryMessenger? = null

    fun attach(messenger: BinaryMessenger) {
        if (currentMessenger === messenger && channel != null) return
        channel?.setMethodCallHandler(null)
        currentMessenger = messenger
        channel = MethodChannel(messenger, CHANNEL_NAME).also { it.setMethodCallHandler(this) }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method !in METHODS) {
            result.notImplemented()
            return
        }
        executor.execute {
            val outcome = runCatching { handle(call) }
            mainHandler.post {
                outcome.fold(
                    onSuccess = { result.success(it) },
                    onFailure = { t ->
                        Log.w(TAG, "${call.method} failed", t)
                        result.error(ERROR_CODE, t.message, null)
                    },
                )
            }
        }
    }

    private fun handle(call: MethodCall): Any? = when (call.method) {
        "getInstalledWidgets" -> widgetIds()
        "getWidgetData" -> widgetPrefs().getString(call.requiredArg("key"), null)
        "getPendingPlay" -> widgetPrefs().getString(PENDING_PLAY_KEY, null)
        "clearPendingPlay" -> {
            widgetPrefs().edit(commit = true) { remove(PENDING_PLAY_KEY) }
            null
        }

        "saveWidgetData" -> {
            val key = call.requiredArg("key")
            val value: String? = call.argument("value")
            widgetPrefs().edit(commit = true) {
                if (value == null) remove(key) else putString(key, value)
            }
            null
        }

        else -> {
            refreshWidgets()
            null
        }
    }

    private fun widgetIds(): IntArray = manager().getAppWidgetIds(provider())

    private fun refreshWidgets() {
        val ids = widgetIds()
        if (ids.isEmpty()) return
        val intent = Intent(AppWidgetManager.ACTION_APPWIDGET_UPDATE).apply {
            setPackage(appContext.packageName)
            putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, ids)
        }
        appContext.sendBroadcast(intent)
    }

    private fun manager() = AppWidgetManager.getInstance(appContext)

    private fun provider() = ComponentName(appContext, MediaWidgetProvider::class.java)

    private fun widgetPrefs() = appContext.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)

    private fun MethodCall.requiredArg(name: String): String =
        argument<String>(name) ?: throw IllegalArgumentException("Missing '$name' argument")

    companion object {
        private const val TAG = "WidgetChannelHandler"
        const val CHANNEL_NAME = "com.likhithpraveenk.storii/widget"
        const val PREFS_FILE = "HomeWidgetPreferences"
        private const val PENDING_PLAY_KEY = "pending_play"
        private const val ERROR_CODE = "widget_channel_error"
        private val METHODS = setOf(
            "getInstalledWidgets",
            "getWidgetData",
            "saveWidgetData",
            "updateWidget",
            "getPendingPlay",
            "clearPendingPlay",
        )

        @Volatile
        private var instance: WidgetChannelHandler? = null

        fun attachTo(context: Context, messenger: BinaryMessenger): WidgetChannelHandler {
            return (instance ?: synchronized(this) {
                instance ?: WidgetChannelHandler(context.applicationContext).also { instance = it }
            }).also {
                it.attach(messenger)
            }
        }

        fun queuePendingPlay(context: Context, itemId: String, episodeId: String?) {
            context.applicationContext.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                .edit(commit = true) { putString(PENDING_PLAY_KEY, "$itemId:$episodeId") }
        }

        fun notifyPendingPlay() {
            instance?.mainHandler?.post {
                instance?.channel?.invokeMethod(
                    "pendingPlayQueued",
                    null,
                    object : MethodChannel.Result {
                        override fun success(result: Any?) {}
                        override fun error(
                            errorCode: String, errorMessage: String?, errorDetails: Any?
                        ) {
                        }

                        override fun notImplemented() {}
                    },
                )
            }
        }
    }
}
