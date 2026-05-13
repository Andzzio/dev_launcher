import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class HotKeyBadge extends StatelessWidget {
  final String label;
  final double size;
  final IconData? icon;
  const HotKeyBadge({
    super.key,
    required this.label,
    this.size = 12,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: size * 0.2),
      decoration: BoxDecoration(
        color: Color(ThemeUi.secondaryBgColor),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(ThemeUi.mainBorderCardColor),
          width: 0.5,
        ),
      ),
      child: icon != null
          ? Icon(icon, size: size, color: Color(ThemeUi.fontColorSecondary))
          : Text(
              label,
              style: TextStyle(
                color: Color(ThemeUi.fontColorSecondary),
                fontSize: size,
              ),
            ),
    );
  }
}
