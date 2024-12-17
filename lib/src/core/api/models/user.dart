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
    role = json['role'];
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
    data['role'] = role;
    return data;
  }

  @override
  String toString() {
    return """
    ' User id :$id,
     User st_id: $studentId,
     User firstname: $firstname,
     User lastname: $lastname,
     User email: $email,
     User username: $username,
     User password: $password,
     User count_units: $countUnits,
     User track_id: $trackId,
     User track: $track,
     User dr_id: $doctorId,
     User doctor: $doctor,
     User project_id: $projectId,
     User project: $project,
     User phone_num: $phoneNumber,
     User role: $role
    """;
  }

  User copyWith({
    int? id,
    int? studentId,
    String? firstname,
    String? lastname,
    String? email,
    String? username,
    String? password,
    int? countUnits,
    int? trackId,
    String? track,
    int? doctorId,
    String? doctor,
    int? projectId,
    String? project,
    String? phoneNumber,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      countUnits: countUnits ?? this.countUnits,
      trackId: trackId ?? this.trackId,
      track: track ?? this.track,
      doctorId: doctorId ?? this.doctorId,
      doctor: doctor ?? this.doctor,
      projectId: projectId ?? this.projectId,
      project: project ?? this.project,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
    );
  }
}
