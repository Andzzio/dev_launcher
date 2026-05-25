import 'dart:io';

import 'package:dev_launcher/config/shortcuts/app_intents.dart';
import 'package:dev_launcher/presentation/providers/project_list_provider.dart';
import 'package:dev_launcher/presentation/providers/selected_editor_provider.dart';
import 'package:dev_launcher/presentation/providers/selected_key_project_provider.dart';
import 'package:dev_launcher/presentation/widgets/misc_side_widget.dart';
import 'package:dev_launcher/presentation/widgets/project_list_widget.dart';
import 'package:dev_launcher/presentation/widgets/search_bar_widget.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final selectedProjectKeyNotifier = ref.read(
      selectedKeyProjectProvider.notifier,
    );

    return Actions(
      actions: <Type, Action<Intent>>{
        NextProjectIntent: CallbackAction<NextProjectIntent>(
          onInvoke: (intent) {
            selectedProjectKeyNotifier.nextProject(_itemScrollController);
            return null;
          },
        ),
        PreviousProjectIntent: CallbackAction<PreviousProjectIntent>(
          onInvoke: (intent) {
            selectedProjectKeyNotifier.previousProject(_itemScrollController);
            return null;
          },
        ),
        OpenProjectIntent: CallbackAction<OpenProjectIntent>(
          onInvoke: (intent) {
            final projectList = ref.read(projectListProvider).value;
            final selectedIndex = ref.read(selectedKeyProjectProvider);

            final command = ref.watch(selectedEditorProvider)?.command;

            if (projectList != null) {
              try {
                final selectedProject = projectList[selectedIndex];
                Process.start(command ?? "code", [
                  selectedProject.path,
                ], runInShell: true);
              } catch (e) {
                if (!context.mounted) return;

                ThemeUi.showSnackBar(context, "Error opening project: $e");
              }
            }
            return null;
          },
        ),
        GoBackIntent: CallbackAction<GoBackIntent>(onInvoke: (intent) => null),
        OpenSettingsIntent: CallbackAction<OpenSettingsIntent>(
          onInvoke: (intent) {
            context.go("/settings");
            return null;
          },
        ),
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchBarWidget(),
              Expanded(
                child: ProjectListWidget(
                  itemScrollController: _itemScrollController,
                ),
              ),
              const MiscSideWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
