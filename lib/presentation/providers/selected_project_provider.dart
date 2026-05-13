import 'package:dev_launcher/presentation/providers/project_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedProjectProvider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void nextProject() {
    final projects = ref.read(projectListProvider).value;
    if (projects == null) return;
    if (state < projects.length - 1) {
      state++;
    }
  }

  void previousProject() {
    if (state > 0) {
      state--;
    }
  }

  void goToProject({required int index}) {
    state = index;
  }
}

final selectedProjectProvider = NotifierProvider<SelectedProjectProvider, int>(
  SelectedProjectProvider.new,
);
