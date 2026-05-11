import 'package:dev_launcher/data/repos/project_repository_impl.dart';
import 'package:dev_launcher/domain/repos/project_repository.dart';
import 'package:dev_launcher/presentation/providers/datasources_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectRepositoryProvider = Provider<ProjectRepository>(
  (ref) =>
      ProjectRepositoryImpl(dataSource: ref.watch(projectDataSourceProvider)),
);
