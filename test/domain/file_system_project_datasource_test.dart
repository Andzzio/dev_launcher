import 'package:dev_launcher/data/datasources/dart_io_project_datasource.dart';
import 'package:dev_launcher/domain/entities/project_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DartIoProjectDatasource datasource;

  setUp(() {
    datasource = DartIoProjectDatasource();
  });

  group("DartIOProjectDatasource", () {
    test("Not add projects from normal folders", () async {
      final String tPath = "D:\\games";
      final List<ProjectEntity> expectProjects = [];
      final result = await datasource.getProjects(tPath);
      expect(result, expectProjects);
    });
    test("Get Projects list from path", () async {
      final String tPath = "D:\\proyectos";
      final List<ProjectEntity> expectProjects = [
        ProjectEntity(
          path: "D:\\proyectos\\dev_launcher",
          name: "dev_launcher",
          type: ProjectType.dart,
        ),
        ProjectEntity(
          path: "D:\\proyectos\\air_mate",
          name: "air_mate",
          type: ProjectType.dart,
        ),
        ProjectEntity(
          path: "D:\\proyectos\\boty-nyxx",
          name: "boty-nyxx",
          type: ProjectType.dart,
        ),
        ProjectEntity(
          path: "D:\\proyectos\\roblox-dart",
          name: "roblox-dart",
          type: ProjectType.dart,
        ),
        ProjectEntity(
          path: "D:\\proyectos\\snake_dart",
          name: "snake_dart",
          type: ProjectType.dart,
        ),
        ProjectEntity(
          path: "D:\\proyectos\\virtual-catalog",
          name: "virtual-catalog",
          type: ProjectType.dart,
        ),
      ];
      final result = await datasource.getProjects(tPath);
      for (var p in result) {
        debugPrint("Encontrado: ${p.name} - ${p.type}");
      }
      expect(
        result.map((e) => e.name).toList(),
        containsAll(expectProjects.map((e) => e.name).toList()),
      );
    });
  });
}
