import 'dart:io';
import 'package:dev_launcher/domain/datasources/file_system_project_datasource.dart';
import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class DartIoProjectDatasource implements FileSystemProjectDatasource {
  final _excludedDir = {
    'node_modules',
    'build',
    '.git',
    '.dart_tool',
    '.gradle',
    '__pycache__',
    'target',
    '.idea',
    '.vscode',
  };
  @override
  Future<List<ProjectEntity>> getProjects(String path) async {
    final directory = Directory(path);
    final List<ProjectEntity> projects = [];
    if (!await directory.exists()) {
      debugPrint("Directory not found: $path");
      return projects;
    }
    await _scanDirectories(directory, projects);
    return projects;
  }

  Future<void> _scanDirectories(
    Directory directory,
    List<ProjectEntity> projects,
  ) async {
    try {
      final entities = await directory.list(recursive: false).handleError((e) {
        debugPrint("Error reading directory list: $e");
      }).toList();

      for (final FileSystemEntity entity in entities) {
        if (entity is File) {
          final project = _detectProject(entity);
          if (project != null) {
            projects.add(project);
            return;
          }
        }
      }

      for (final FileSystemEntity entity in entities) {
        if (entity is Directory) {
          final name = p.basename(entity.path);
          if (_excludedDir.contains(name)) continue;
          await _scanDirectories(entity, projects);
        }
      }
    } catch (e) {
      debugPrint("Error reading directory: $e");
    }
  }

  ProjectEntity? _detectProject(File file) {
    final String name = p.basename(file.path);
    final String projectPath = p.dirname(file.path);
    final String directoryName = p.basename(projectPath);
    ProjectType? detectedType;

    switch (name) {
      case "pubspec.yaml":
        detectedType = ProjectType.dart;
        break;
      case "CMakeLists.txt":
        detectedType = ProjectType.cpp;
        break;
      default:
        detectedType = null;
        break;
    }

    if (detectedType == null) return null;
    return ProjectEntity(
      path: projectPath,
      name: directoryName,
      type: detectedType,
    );
  }
}
