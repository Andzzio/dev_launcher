import 'package:dev_launcher/presentation/providers/item_scroll_controller_provider.dart';
import 'package:dev_launcher/presentation/providers/selected_key_project_provider.dart';
import 'package:dev_launcher/presentation/widgets/misc_side_widget.dart';
import 'package:dev_launcher/presentation/widgets/project_list_widget.dart';
import 'package:dev_launcher/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectNotifier = ref.read(
      selectedKeyProjectProvider.notifier,
    );
    final itemScrollController = ref.read(itemScrollControllerProvider);
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          switch (event.logicalKey) {
            case LogicalKeyboardKey.arrowDown:
              selectedProjectNotifier.nextProject(itemScrollController);
              return KeyEventResult.handled;
            case LogicalKeyboardKey.arrowUp:
              selectedProjectNotifier.previousProject(itemScrollController);
              return KeyEventResult.handled;
            case LogicalKeyboardKey.enter:
              //open project
              return KeyEventResult.handled;
            case LogicalKeyboardKey.escape:
              //hide app
              return KeyEventResult.handled;
            default:
              return KeyEventResult.ignored;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchBarWidget(),
            const Expanded(child: ProjectListWidget()),
            const MiscSideWidget(),
          ],
        ),
      ),
    );
  }
}
