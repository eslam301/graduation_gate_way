import '../../../features/project_registeration/data/models/project_model.dart';

class ProjectRecommendationModel extends ProjectModel {
  double? probability;

  String? category;
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
    this.difficultyLevel,
    this.keywords,
    this.imageLink,
    this.links,
    this.skillsRequired,
    this.title,
    this.probability,
    super.id,
    super.name,
    super.categoryName,
    super.proposalName,
    super.rate,
    super.description,
    super.students,
    super.doctorsNames,
  }) {
    _initializeLists();
  }

  ProjectRecommendationModel.copyWith(
    ProjectRecommendationModel projectRecommendationModel,
  ) : this(
          category: projectRecommendationModel.category,
          difficultyLevel: projectRecommendationModel.difficultyLevel,
          keywords: projectRecommendationModel.keywords,
          imageLink: projectRecommendationModel.imageLink,
          links: projectRecommendationModel.links,
          skillsRequired: projectRecommendationModel.skillsRequired,
          title: projectRecommendationModel.title,
          probability: projectRecommendationModel.probability,
          id: projectRecommendationModel.id,
          name: projectRecommendationModel.name,
          categoryName: projectRecommendationModel.categoryName,
          proposalName: projectRecommendationModel.proposalName,
          rate: projectRecommendationModel.rate,
          description: projectRecommendationModel.description,
          students: projectRecommendationModel.students,
          doctorsNames: projectRecommendationModel.doctorsNames,
        );

  ProjectRecommendationModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];

    category = json['category'];
    description = json['description'];
    difficultyLevel = json['difficulty_level'];
    keywords = json['keywords'];
    imageLink = json['image'];

    links = json['link'];
    skillsRequired = json['skills_required'];
    title = json['title'];
    probability = json['probability'];
    name = json['name'];
    categoryName = json['categoryName'];
    proposalName = json['proposalFileName'];
    rate = json['rate'];
    description = json['description'];
    students = json['students'];
    doctorsNames = json['doctorsNames'];
    _initializeLists();
  }

  ProjectRecommendationModel.fromJson2(Map<String, dynamic> json) {
    category = json['Category'];
    description = json['description'];
    difficultyLevel = json['Difficulty Level'];
    keywords = json['Keywords'];
    imageLink = json['image'];
    links = json['Link'];
    skillsRequired = json['Skills Required'];
    title = json['title'];
    probability = json['probability'];
    name = json['name'];
    id = json['ID'];
    categoryName = json['Category'];
    proposalName = json['proposalFileName'];
    rate = json['rate'];
    description = json['Description'];
    students = json['students'];
    doctorsNames = json['doctorsNames'];
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
    categoryList: $categoryList
    
    """;
  }
}
