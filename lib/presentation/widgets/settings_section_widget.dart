import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class SettingsSectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SettingsSectionWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(ThemeUi.fontColorSecondary),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
