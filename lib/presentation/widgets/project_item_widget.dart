import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';

class ProjectItemWidget extends StatelessWidget {
  final bool isSelected;
  final ProjectEntity project;
  const ProjectItemWidget({
    super.key,
    required this.isSelected,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
      decoration: BoxDecoration(
        border: isSelected
            ? Border(left: BorderSide(color: Colors.white, width: 2.5))
            : null,
        color: isSelected
            ? Color(ThemeUi.mainSelectedBgColor)
            : Colors.transparent,
      ),
      child: Row(
        children: [
          Icon(Icons.folder, color: Colors.grey),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(project.name),
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
