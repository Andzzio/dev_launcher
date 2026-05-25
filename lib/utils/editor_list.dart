import 'package:dev_launcher/domain/entities/editor_entity.dart';

class EditorList {
  final List<EditorEntity> editors = [
    EditorEntity(name: "VS Code", command: "code"),
    EditorEntity(name: "IntelliJ IDEA", command: "idea"),
    EditorEntity(name: "Sublime Text", command: "subl"),
    EditorEntity(name: "Zed", command: "zed"),
    EditorEntity(name: "Notepad++", command: "notepad++"),
    EditorEntity(name: "Antigravity", command: "antigravity"),
    EditorEntity(name: "Cursor", command: "cursor"),
    EditorEntity(name: "Windsurf", command: "windsurf"),
    EditorEntity(name: "Android Studio", command: "studio"),
  ];
}
