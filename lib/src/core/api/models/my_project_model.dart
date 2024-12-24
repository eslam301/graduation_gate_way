import '../../../features/project_registeration/data/models/project_model.dart';

class MyProjectModel {
  final int? id;
  final String? projectName;
  final String? doctorName;
  final String? description;
  final String? proposalFileName;
  final List<Student>? students;

  MyProjectModel({
    this.id,
    this.projectName,
    this.doctorName,
    this.description,
    this.proposalFileName,
    this.students,
  });

  factory MyProjectModel.fromJson(Map<String, dynamic> json) {
    return MyProjectModel(
      id: json['projectId'],
      projectName: json['projectName'],
      doctorName: json['doctorName'],
      description: json['projectDescription'],
      proposalFileName: json['proposalName'],
      students: List<Student>.from(
          json['students'].map((student) => Student.fromJson(student))),
    );
  }

  static MyProjectModel emptyIt() => MyProjectModel();

  @override
  String toString() {
    return """
    ' Project id :$id,
     Project projectName: $projectName,
     Project doctorName: $doctorName,
     Project description: $description,
     Project proposalFileName: $proposalFileName,
     Project students: ${students.toString()},
    """;
  }
}
