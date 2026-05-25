import 'package:dev_launcher/domain/entities/editor_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedEditorProvider extends Notifier<EditorEntity?> {
  @override
  EditorEntity? build() {
    return null;
  }

  void setEditor(EditorEntity editor) {
    state = editor;
  }

  void clearEditor() {
    state = null;
  }
}

final selectedEditorProvider =
    NotifierProvider<SelectedEditorProvider, EditorEntity?>(
      SelectedEditorProvider.new,
    );
