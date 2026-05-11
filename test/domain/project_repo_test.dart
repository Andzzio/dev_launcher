import 'package:dev_launcher/data/repos/project_repository_impl.dart';
import 'package:dev_launcher/domain/datasources/file_system_project_datasource.dart';
import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFileSystemProjectDatasource extends Mock
    implements FileSystemProjectDatasource {}

void main() {
  late MockFileSystemProjectDatasource dataSource;
  late ProjectRepositoryImpl repository;

  setUp(() {
    dataSource = MockFileSystemProjectDatasource();
    repository = ProjectRepositoryImpl(dataSource: dataSource);
  });

  group('ProjectRepositoryImpl', () {
    final String tPath = "D:\\games";
    final List<ProjectEntity> tProjects = [
      ProjectEntity(
        path: "D:\\games\\Among us",
        name: "Among us",
        type: ProjectType.cpp,
      ),
      ProjectEntity(
        path: "D:\\games\\GTA San Andres",
        name: "GTA San Andres",
        type: ProjectType.cpp,
      ),
      ProjectEntity(
        path: "D:\\games\\Riot Games",
        name: "Riot Games",
        type: ProjectType.cpp,
      ),
    ];

    test('Return a project entity list', () async {
      when(() {
        return dataSource.getProjects(tPath);
      }).thenAnswer((invocation) async {
        return tProjects;
      });

      final result = await repository.getProjects(tPath);

      expect(result, tProjects);
      verify(() => dataSource.getProjects(tPath)).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });
}
