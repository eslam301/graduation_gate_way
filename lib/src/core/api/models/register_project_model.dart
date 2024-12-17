class RegisterProjectModel {
  String? name;
  String? description;
  String? proposalFileName;
  int? categoryId;
  int? doctorId;
  List<int>? studentIds;

  // Constructor
  RegisterProjectModel({
    this.name,
    this.description,
    this.proposalFileName,
    this.categoryId,
    this.doctorId,
    this.studentIds,
  });

  // Empty factory method with reasonable defaults
  RegisterProjectModel.empty()
      : name = '',
        description = '',
        proposalFileName = '',
        categoryId = 0,
        doctorId = 0,
        studentIds = const [];

  // Factory for creating an instance from JSON
  factory RegisterProjectModel.fromJson(Map<String, dynamic> json) {
    return RegisterProjectModel(
      name: json['name'],
      description: json['description'],
      proposalFileName: json['proposalFileName'],
      categoryId: json['categoryId'] ?? 0,
      doctorId: json['doctorId'] ?? 0,
      studentIds:
          json['studentIds'] != null ? List<int>.from(json['studentIds']) : [],
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'proposalFileName': proposalFileName,
      'categoryId': categoryId,
      'doctorId': doctorId,
      'studentIds': studentIds,
    };
  }

  // Improved copyWith method (returns a new instance)
  RegisterProjectModel copyWith({
    String? name,
    String? description,
    String? proposalFileName,
    int? categoryId,
    int? doctorId,
    List<int>? studentIds,
  }) {
    return RegisterProjectModel(
      name: name ?? this.name,
      description: description ?? this.description,
      proposalFileName: proposalFileName ?? this.proposalFileName,
      categoryId: categoryId ?? this.categoryId,
      doctorId: doctorId ?? this.doctorId,
      studentIds: studentIds ?? this.studentIds,
    );
  }

  // Reset all fields to default (mutates the current instance)
  void clear() {
    name = '';
    description = '';
    proposalFileName = '';
    categoryId = 0;
    doctorId = 0;
    studentIds = [];
  }

  @override
  String toString() {
    return 'RegisterProjectModel{name: $name, description: $description, proposalFileName: $proposalFileName, categoryId: $categoryId, doctorId: $doctorId, studentIds: $studentIds}';
  }
}
