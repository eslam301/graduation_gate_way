import 'package:graduation_gate_way/src/core/api/models/login_response.dart';

class User extends LoginResponse {
  int? id;
  int? studentId;
  int? countUnits;
  int? trackId;
  int? doctorId;
  int? projectId;

  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? password;
  String? track;
  String? doctor;
  String? project;
  String? phoneNumber;

  User(
      {this.id,
      this.studentId,
      this.firstname,
      this.lastname,
      this.email,
      this.username,
      this.password,
      this.countUnits,
      this.trackId,
      this.track,
      this.doctorId,
      this.doctor,
      this.projectId,
      this.project,
      this.phoneNumber,
      super.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['st_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    countUnits = json['count_units'];
    trackId = json['track_id'];
    track = json['track'];
    doctorId = json['dr_id'];
    doctor = json['doctor'];
    projectId = json['project_id'];
    project = json['project'];
    phoneNumber = json['phone_num'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['st_id'] = studentId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['count_units'] = countUnits;
    data['track_id'] = trackId;
    data['track'] = track;
    data['dr_id'] = doctorId;
    data['doctor'] = doctor;
    data['project_id'] = projectId;
    data['project'] = project;
    data['phone_num'] = phoneNumber;
    return data;
  }

  @override
  String toString() {
    return """
    '$id,
     $studentId,
     $firstname,
     $lastname,
     $email,
     $username,
     $password,
     $countUnits,
     $trackId,
     $track,
     $doctorId,
     $doctor,
     $projectId,
     $project,
     $phoneNumber,
     $role
    """;
  }
}
