class ProjectEntity {
  final String path;
  final String name;
  final ProjectType type;
  ProjectEntity({required this.path, required this.name, required this.type});
}

enum ProjectType { dart, cpp }
