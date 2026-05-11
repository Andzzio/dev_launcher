import 'package:dev_launcher/domain/datasources/file_system_project_datasource.dart';
import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:dev_launcher/domain/repos/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final FileSystemProjectDatasource dataSource;

  ProjectRepositoryImpl({required this.dataSource});

  @override
  Future<List<ProjectEntity>> getProjects(String path) async {
    return await dataSource.getProjects(path);
  }
}
