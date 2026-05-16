import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/presentation/providers/item_scroll_controller_provider.dart';
import 'package:dev_launcher/presentation/providers/project_list_provider.dart';
import 'package:dev_launcher/presentation/providers/selected_key_project_provider.dart';
import 'package:dev_launcher/presentation/providers/selected_mouse_project_provider.dart';
import 'package:dev_launcher/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProjectListWidget extends ConsumerWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectListState = ref.watch(projectListProvider);
    final selectedProjectKeyIndex = ref.watch(selectedKeyProjectProvider);
    final selectedProjectMouseIndex = ref.watch(selectedMouseProjectProvider);
    final selectedProjectMouseNotifier = ref.read(
      selectedMouseProjectProvider.notifier,
    );
    final itemScrollController = ref.read(itemScrollControllerProvider);
    return projectListState.when(
      data: (projects) => MouseRegion(
        onExit: (_) => selectedProjectMouseNotifier.clear(),
        child: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            final ProjectEntity project = projects[index];
            return MouseRegion(
              onEnter: (event) {
                selectedProjectMouseNotifier.updateIndex(index: index);
              },
              child: ProjectItemWidget(
                isSelectedWithKey: index == selectedProjectKeyIndex,
                isSelectedWithMouse: index == selectedProjectMouseIndex,
                project: project,
              ),
            );
          },
        ),
      ),
      error: (error, stackTrace) => Text("Error: $error"),
      loading: () => CircularProgressIndicator(),
    );
  }
}
