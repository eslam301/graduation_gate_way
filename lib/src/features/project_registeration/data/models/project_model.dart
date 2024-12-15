import '../../../../core/api/models/projects_recommendations.dart';

class ProjectModel extends ProjectRecommendationModel {
  List<Students> students = [];
  List<String> doctorsNames = [];

  ProjectModel({
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
    );
  }
}

class Students {
  String? name;
  String? id;

  Students({required this.name, required this.id});
}
