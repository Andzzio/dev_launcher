import 'package:dev_launcher/domain/repos/project_repository.dart';

class LaunchProjectUsecase {
  final ProjectRepository repository;

  LaunchProjectUsecase(this.repository);

  Future<void> call(String path, String? command) async {
    await repository.launchProject(path, command ?? "code");
  }
}
