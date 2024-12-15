import '../../../features/project_registeration/data/models/project_model.dart';

class ProjectRecommendationModel {
  String? category;
  String? description;
  String? difficultyLevel;
  String? keywords;
  String? imageLink;
  String? links;
  String? skillsRequired;
  String? title;

  List<String>? skillsRequiredList;
  List<String>? keywordsList;
  List<String>? categoryList;

  ProjectRecommendationModel({
    this.category,
    this.description,
    this.difficultyLevel,
    this.keywords,
    this.imageLink,
    this.links,
    this.skillsRequired,
    this.title,
  }) {
    _initializeLists();
  }

  ProjectRecommendationModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    description = json['description'];
    difficultyLevel = json['difficulty_level'];
    keywords = json['keywords'];
    imageLink = json['image'];
    links = json['links'];
    skillsRequired = json['skills_required'];
    title = json['title'];
    _initializeLists();
  }

  void _initializeLists() {
    if (skillsRequired != null) {
      skillsRequiredList =
          skillsRequired!.split(', ').where((e) => e.isNotEmpty).toList();
    }
    if (keywords != null) {
      keywordsList = keywords!.split(', ').where((e) => e.isNotEmpty).toList();
    }
    if (category != null) {
      categoryList = category!.split(', ').where((e) => e.isNotEmpty).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['description'] = description;
    data['difficulty_level'] = difficultyLevel;
    data['keywords'] = keywords;
    data['image'] = imageLink;
    data['links'] = links;
    data['skills_required'] = skillsRequired;
    data['title'] = title;
    return data;
  }

  @override
  String toString() {
    return """
    category: $category,
    description: $description,
    difficultyLevel: $difficultyLevel,
    keywords: $keywords,
    imageLink: $imageLink,
    links: $links,
    skillsRequired: $skillsRequired,
    title: $title,
    skillsRequiredList: $skillsRequiredList,
    keywordsList: $keywordsList
    """;
  }

  ProjectModel toProjectModel() => ProjectModel(
        category: category ?? '',
        description: description ?? '',
        difficultyLevel: difficultyLevel ?? '',
        keywords: keywords ?? '',
        imageLink: imageLink ?? '',
        links: links ?? '',
        skillsRequired: skillsRequired ?? '',
        title: title ?? '',
      );
}
