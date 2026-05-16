import 'package:dev_launcher/presentation/providers/project_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SelectedKeyProjectProvider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void nextProject(ItemScrollController controller) {
    final projects = ref.read(projectListProvider).value;
    if (projects == null) return;
    if (state < projects.length - 1) {
      state++;
      controller.scrollTo(
        index: state,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        alignment: 0.0,
      );
    }
  }

  void previousProject(ItemScrollController controller) {
    if (state > 0) {
      state--;
      controller.scrollTo(
        index: state,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        alignment: 0.0,
      );
    }
  }

  void goToProject({required int index}) {
    state = index;
  }
}

final selectedKeyProjectProvider =
    NotifierProvider<SelectedKeyProjectProvider, int>(
      SelectedKeyProjectProvider.new,
    );
