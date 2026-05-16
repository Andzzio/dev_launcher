import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class ProjectItemWidget extends StatelessWidget {
  final bool isSelectedWithKey;
  final bool isSelectedWithMouse;
  final ProjectEntity project;
  const ProjectItemWidget({
    super.key,
    required this.isSelectedWithKey,
    required this.project,
    required this.isSelectedWithMouse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
      decoration: BoxDecoration(
        border: isSelectedWithKey
            ? Border(left: BorderSide(color: Colors.white, width: 2.5))
            : null,
        color: isSelectedWithKey
            ? Color(ThemeUi.mainSelectedBgColor)
            : isSelectedWithMouse
            ? Color(ThemeUi.mainSecondarySelectedBgColor)
            : Colors.transparent,
      ),
      child: Row(
        children: [
          Icon(Icons.folder, color: Colors.grey),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.name,
                style: TextStyle(
                  color: isSelectedWithKey
                      ? Color(ThemeUi.fontColor)
                      : isSelectedWithMouse
                      ? Color(ThemeUi.fontDesactivateColor)
                      : Color(ThemeUi.fontDesactivateColor),
                ),
              ),
              Text(
                project.path,
                style: TextStyle(color: Color(ThemeUi.fontColorSecondary)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
