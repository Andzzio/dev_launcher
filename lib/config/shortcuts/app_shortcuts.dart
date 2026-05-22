import 'package:dev_launcher/config/shortcuts/app_intents.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final Map<ShortcutActivator, Intent> globalShortcuts = {
  const SingleActivator(LogicalKeyboardKey.arrowDown):
      const NextProjectIntent(),
  const SingleActivator(LogicalKeyboardKey.arrowUp):
      const PreviousProjectIntent(),
  const SingleActivator(LogicalKeyboardKey.enter): const OpenProjectIntent(),
  const SingleActivator(LogicalKeyboardKey.escape): const GoBackIntent(),
  const SingleActivator(LogicalKeyboardKey.keyS): const OpenSettingsIntent(),
};
