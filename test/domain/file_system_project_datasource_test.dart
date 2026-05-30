import 'package:dev_launcher/data/datasources/dart_io_project_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DartIoProjectDatasource datasource;

  setUp(() {
    datasource = DartIoProjectDatasource();
  });

  group("DartIOProjectDatasource", () {
    test("Not add projects from normal folders", () async {
      final result = await datasource.getProjects(
        "test/fixtures/fake_projects/normal_folder",
      );
      expect(result, isEmpty);
    });

    test("Get Projects list from path", () async {
      final result = await datasource.getProjects(
        "test/fixtures/fake_projects",
      );
      expect(
        result.map((e) => e.name).toList(),
        containsAll(["proyecto_dart", "proyecto_rust", "proyecto_cpp_no_ide"]),
      );
    });
  });
}
