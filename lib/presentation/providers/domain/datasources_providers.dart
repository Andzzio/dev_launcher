import 'package:dev_launcher/data/datasources/dart_io_project_datasource.dart';
import 'package:dev_launcher/domain/datasources/file_system_project_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectDataSourceProvider = Provider<FileSystemProjectDatasource>(
  (ref) => DartIoProjectDatasource(),
);
