import 'package:dev_launcher/presentation/widgets/hot_key_badge.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsBarWidget extends StatelessWidget {
  const SettingsBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(ThemeUi.mainBorderCardColor),
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            const Text("Settings"),
            Spacer(),
            TextButton(
              focusNode: FocusNode(canRequestFocus: false),
              onPressed: () {
                context.go("/");
              },
              child: Row(
                spacing: 10,
                children: [
                  HotKeyBadge(label: "esc"),
                  Icon(
                    Icons.keyboard_return,
                    color: Color(ThemeUi.fontColorSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
