import 'package:dev_launcher/presentation/widgets/hot_key_badge.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

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
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Color(ThemeUi.fontColorSecondary),
                  ),
                  hintText: "search project...",
                  hintStyle: TextStyle(
                    color: Color(ThemeUi.fontColorSecondary),
                  ),
                ),
              ),
            ),
            const HotKeyBadge(label: "esc"),
          ],
        ),
      ),
    );
  }
}
