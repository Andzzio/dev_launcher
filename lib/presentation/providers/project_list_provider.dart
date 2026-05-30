import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/presentation/providers/domain/repositories_providers.dart';
import 'package:dev_launcher/presentation/providers/domain/usecases_providers.dart';
import 'package:dev_launcher/presentation/providers/selected_path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectListProvider extends AsyncNotifier<List<ProjectEntity>> {
  @override
  Future<List<ProjectEntity>> build() async {
    final String? path = ref.watch(selectedPathProvider);

    if (path == null) return [];

    final subscription = ref
        .read(projectRepositoryProvider)
        .watchDirectory(path)
        .listen((event) => ref.invalidateSelf());

    ref.onDispose(() => subscription.cancel());

    return ref.read(getProjectListUsecaseProvider).call(path: path);
  }
}

final projectListProvider =
    AsyncNotifierProvider<ProjectListProvider, List<ProjectEntity>>(
      ProjectListProvider.new,
    );
