import 'package:dev_launcher/domain/usecases/get_project_list_usecase.dart';
import 'package:dev_launcher/presentation/providers/domain/repositories_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProjectListUsecaseProvider = Provider<GetProjectListUsecase>(
  (ref) => GetProjectListUsecase(repo: ref.watch(projectRepositoryProvider)),
);
