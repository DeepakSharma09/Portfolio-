// lib/model/project.dart
enum SampleType { image, link, video }

class ProjectSample {
  final SampleType type;
  final String src;       // asset path or URL
  final String? caption;  // optional
  const ProjectSample({required this.type, required this.src, this.caption});
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? imagePath;
  final String? link;           // e.g., Play Store / website
  final List<ProjectSample> samples;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.imagePath,
    this.link,
    this.samples = const [],
  });
}
