import 'dart:io';
import 'package:dev_launcher/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> getProjects(String path);

  Future<void> launchProject(String path, String command);

  Stream<FileSystemEvent> watchDirectory(String path);
}
