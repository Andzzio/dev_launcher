import 'package:dev_launcher/presentation/widgets/editor_settings_widget.dart';
import 'package:dev_launcher/presentation/widgets/path_settings_widget.dart';
import 'package:dev_launcher/presentation/widgets/settings_section_widget.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class SettingsBodyWidget extends StatelessWidget {
  const SettingsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsSectionWidget(
            title: "Editor Settings",
            children: [EditorSettingsWidget()],
          ),
          Divider(
            color: Color(ThemeUi.mainBorderCardColor),
            thickness: 0.5,
            height: 0.5,
          ),
          SettingsSectionWidget(
            title: "Project Settings",
            children: [PathSettingsWidget()],
          ),
        ],
      ),
    );
  }
}
