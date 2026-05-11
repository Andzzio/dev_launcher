import 'package:dev_launcher/domain/entities/project_entity.dart';

abstract class FileSystemProjectDatasource {
  Future<List<ProjectEntity>> getProjects(String path);
}
