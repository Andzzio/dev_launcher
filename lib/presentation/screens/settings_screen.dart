import 'package:dev_launcher/config/shortcuts/app_intents.dart';
import 'package:dev_launcher/presentation/widgets/settings_bar_widget.dart';
import 'package:dev_launcher/presentation/widgets/settings_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        GoBackIntent: CallbackAction<GoBackIntent>(
          onInvoke: (intent) {
            context.go("/");
            return null;
          },
        ),
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              SettingsBarWidget(),
              Expanded(child: SettingsBodyWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
