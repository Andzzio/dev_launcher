import 'package:dev_launcher/presentation/providers/selected_path_provider.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PathSettingsWidget extends ConsumerWidget {
  const PathSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPath = ref.watch(selectedPathProvider);
    final selectedPathNotifier = ref.read(selectedPathProvider.notifier);
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
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(ThemeUi.secondaryBgColor),
                  ),
                  child: Text(
                    selectedPath ?? "Select your default project path",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(ThemeUi.fontColorSecondary),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    String? dir = await FilePicker.getDirectoryPath();
                    if (dir != null) {
                      selectedPathNotifier.setPath(dir);
                    }
                  } catch (e) {
                    if (!context.mounted) return;

                    ThemeUi.showSnackBar(
                      context,
                      "Error picking directory: $e",
                    );
                  }
                },
                icon: Icon(
                  Icons.folder_open_outlined,
                  color: Color(ThemeUi.fontColorSecondary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
