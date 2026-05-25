import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedPathProvider extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  void setPath(String path) {
    state = path;
  }

  void clearPath() {
    state = null;
  }
}

final selectedPathProvider = NotifierProvider<SelectedPathProvider, String?>(
  SelectedPathProvider.new,
);
