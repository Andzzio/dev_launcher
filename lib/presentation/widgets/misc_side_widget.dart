import 'package:dev_launcher/presentation/widgets/hot_key_badge.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class MiscSideWidget extends StatelessWidget {
  const MiscSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(ThemeUi.mainBorderCardColor),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          HotKeyBadge(
            label: "enter",
            icon: Icons.subdirectory_arrow_left_rounded,
            size: 15,
          ),
          Text(
            "open",
            style: TextStyle(color: Color(ThemeUi.fontColorSecondary)),
          ),
          SizedBox(width: 5),
          HotKeyBadge(label: "ctrl"),
          Text(
            "options",
            style: TextStyle(color: Color(ThemeUi.fontColorSecondary)),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: Color(ThemeUi.fontColorSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
