import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/presentation/providers/usecases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectListProvider extends AsyncNotifier<List<ProjectEntity>> {
  @override
  Future<List<ProjectEntity>> build() async {
    final String testPath = "D:\\proyectos";
    return ref.read(getProjectListUsecaseProvider).call(path: testPath);
  }
}

final projectListProvider =
    AsyncNotifierProvider<ProjectListProvider, List<ProjectEntity>>(
      ProjectListProvider.new,
    );
