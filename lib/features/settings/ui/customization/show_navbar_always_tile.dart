import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class ShowNavbarAlwaysTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(showNavbarAlwaysProvider);

    return SwitchListTile(
      value: show,
      title: Text(l10n.showNavbarAlways),
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setShowNavbarAlways(value);
      },
    );
  }
}
