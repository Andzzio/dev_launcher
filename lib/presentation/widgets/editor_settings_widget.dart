import 'package:dev_launcher/domain/entities/editor_entity.dart';
import 'package:dev_launcher/presentation/providers/selected_editor_provider.dart';
import 'package:dev_launcher/utils/editor_list.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditorSettingsWidget extends ConsumerWidget {
  const EditorSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEditor = ref.watch(selectedEditorProvider);
    final selectedEditorNotifier = ref.read(selectedEditorProvider.notifier);
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Editor/IDE", style: TextStyle(fontSize: 14)),
          Text(
            "This is where you can set your default editor/IDE for fast opening projects.",
            style: TextStyle(
              color: Color(ThemeUi.fontColorSecondary),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton2<EditorEntity>(
              hint: Text(
                selectedEditor != null
                    ? selectedEditor.name
                    : "Select your editor/IDE",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(ThemeUi.fontColorSecondary),
                ),
              ),
              isExpanded: true,
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(ThemeUi.secondaryBgColor),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(ThemeUi.secondaryBgColor),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                borderRadius: BorderRadius.circular(8),
              ),
              items: EditorList().editors
                  .map(
                    (editor) => DropdownItem<EditorEntity>(
                      value: editor,
                      child: Text(editor.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                selectedEditorNotifier.setEditor(value);
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
