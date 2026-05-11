import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/domain/repos/project_repository.dart';

class GetProjectListUsecase {
  final ProjectRepository repo;
  GetProjectListUsecase({required this.repo});
  Future<List<ProjectEntity>> call({required String path}) async {
    return await repo.getProjects(path);
  }
}
