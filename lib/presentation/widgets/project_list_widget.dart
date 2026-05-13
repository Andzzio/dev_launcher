import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/presentation/providers/project_list_provider.dart';
import 'package:dev_launcher/presentation/providers/selected_project_provider.dart';
import 'package:dev_launcher/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectListWidget extends ConsumerWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectListState = ref.watch(projectListProvider);
    final selectedProjectIndex = ref.watch(selectedProjectProvider);
    final selectedProjectNotifier = ref.read(selectedProjectProvider.notifier);
    return projectListState.when(
      data: (projects) => ListView.builder(
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) {
          final ProjectEntity project = projects[index];
          return MouseRegion(
            onEnter: (event) {
              selectedProjectNotifier.goToProject(index: index);
            },
            child: ProjectItemWidget(
              isSelected: index == selectedProjectIndex,
              project: project,
            ),
          );
        },
      ),
      error: (error, stackTrace) => Text("Error: $error"),
      loading: () => CircularProgressIndicator(),
    );
  }
}
