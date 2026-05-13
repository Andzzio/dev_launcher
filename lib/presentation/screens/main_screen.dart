import 'package:dev_launcher/presentation/widgets/misc_side_widget.dart';
import 'package:dev_launcher/presentation/widgets/project_list_widget.dart';
import 'package:dev_launcher/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SearchBarWidget(),
          const Expanded(child: ProjectListWidget()),
          const MiscSideWidget(),
        ],
      ),
    );
  }
}
