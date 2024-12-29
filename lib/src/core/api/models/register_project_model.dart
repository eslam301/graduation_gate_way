import 'dart:io';

class RegisterProjectModel {
  int? categoryId;
  int? doctorId;
  int? studentId;

  String? studentName;
  String? projectName;
  String? description;
  String? proposalFileName;
  File? file;

  // Constructor
  RegisterProjectModel({
    this.categoryId,
    this.doctorId,
    this.studentId,
    this.studentName,
    this.projectName,
    this.description,
    this.proposalFileName,
    this.file,
  });

  // Empty factory method with reasonable defaults
  RegisterProjectModel.empty()
      : projectName = '',
        description = '',
        proposalFileName = '',
        studentName = '',
        categoryId = 0,
        doctorId = 0,
        file = File(''),
        studentId = 0;

  // Factory for creating an instance from JSON
  factory RegisterProjectModel.fromJson(Map<String, dynamic> json) {
    return RegisterProjectModel(
      projectName: json['name'],
      description: json['description'],
      proposalFileName: json['proposalFileName'],
      studentName: json['studentName'],
      categoryId: json['categoryId'] ?? 0,
      doctorId: json['doctorId'] ?? 0,
      studentId: json['st_id'],
      file: File(''),
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': projectName,
      'description': description,
      'proposalFileName': proposalFileName,
      'studentName': studentName,
      'categoryId': categoryId,
      'doctorId': doctorId,
      'studentId': studentId,
    };
  }

  Map<String, dynamic> toJsonBody() {
    return {
      'name': projectName,
      'description': description,
      'proposalFileName': proposalFileName,
      'categoryId': categoryId,
      'doctorId': doctorId,
      'st_id': studentId,
    };
  }

  // Improved copyWith method (returns a new instance)
  RegisterProjectModel copyWith(
      {String? projectName,
      String? description,
      String? proposalFileName,
      String? studentName,
      int? categoryId,
      int? doctorId,
      int? studentId,
      File? file}) {
    return RegisterProjectModel(
        projectName: projectName ?? this.projectName,
        description: description ?? this.description,
        proposalFileName: proposalFileName ?? this.proposalFileName,
        studentName: studentName ?? this.studentName,
        categoryId: categoryId ?? this.categoryId,
        doctorId: doctorId ?? this.doctorId,
        studentId: studentId ?? this.studentId,
        file: file ?? this.file);
  }

  // Reset all fields to default (mutates the current instance)
  void clear() {
    projectName = '';
    description = '';
    proposalFileName = '';
    categoryId = 0;
    doctorId = 0;
    studentId = 0;
    studentName = '';
  }

  @override
  String toString() {
    return 'RegisterProjectModel{file: $file, studentName: $studentName, project name: $projectName, description: $description, proposalFileName: $proposalFileName, categoryId: $categoryId, doctorId: $doctorId, studentIds: $studentId}';
  }
}
