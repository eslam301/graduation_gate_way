import '../../../../core/api/models/projects_recommendations.dart';

class ProjectModel extends ProjectRecommendationModel {
  final String projectId;
  final String? projectName;
  final String? projectDescription;
  final String? proposalName;

  List<Student> students = [];
  List<String> doctorsNames = [];

  ProjectModel({
    required this.projectId,
    required this.projectName,
    required this.projectDescription,
    required this.proposalName,
    required String category,
    required String description,
    required String difficultyLevel,
    required String keywords,
    required String imageLink,
    required String links,
    required String skillsRequired,
    required String title,
  }) : super(
          category: category,
          description: description,
          difficultyLevel: difficultyLevel,
          keywords: keywords,
          imageLink: imageLink,
          links: links,
          skillsRequired: skillsRequired,
          title: title,
        );

  factory ProjectModel.empty() {
    return ProjectModel(
      category: '',
      description: '',
      difficultyLevel: '',
      keywords: '',
      imageLink: '',
      links: '',
      skillsRequired: '',
      title: '',
      projectId: '',
      projectName: '',
      projectDescription: '',
      proposalName: '',
    );
  }
}

class Student {
  String? name;
  int? id;

  Student({required this.name, required this.id});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(name: json['fullName'], id: json['st_id']);
  }

  @override
  String toString() {
    return 'Student(name: $name, id: $id)';
  }
}
