import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class PathSettingsWidget extends StatelessWidget {
  const PathSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Default Project Path", style: TextStyle(fontSize: 14)),
          Text(
            "This is where you can set your default project path.",
            style: TextStyle(
              color: Color(ThemeUi.fontColorSecondary),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: "Enter default project path...",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(ThemeUi.fontColorSecondary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
