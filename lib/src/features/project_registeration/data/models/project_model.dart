class ProjectModel {
  int? id;
  int? categoryId;
  double? rate;
  String? name;
  String? description;
  String? categoryName;
  String? proposalName;

  List<Student>? students = [];
  List<String>? doctorsNames = [];

  ProjectModel(
      {this.id,
      this.name,
      this.description,
      this.categoryName,
      this.categoryId,
      this.proposalName,
      this.rate,
      this.students,
      this.doctorsNames});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
    proposalName = json['proposalFileName'];
    rate = json['rate'];
    if (json['students'] != null) {
      students = <Student>[];
      json['students'].forEach((v) {
        students?.add(Student.fromJson(v));
      });
    }
    if (json['doctorsNames'] != null) {
      doctorsNames = <String>[];
      json['doctorsNames'].forEach((v) {
        doctorsNames?.add(v);
      });
    }
  }

  ProjectModel.empty() {
    id = null;
    name = null;
    description = null;
    categoryName = null;
    proposalName = null;
    rate = null;
    students = [];
    doctorsNames = [];
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
