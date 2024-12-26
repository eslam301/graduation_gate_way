import 'package:graduation_gate_way/src/core/api/models/user.dart';

class StudentModel extends User {
  StudentModel({
    super.id,
    super.studentId,
    super.firstname,
    super.lastname,
    super.email,
    super.username,
    super.password,
    super.countUnits,
    super.trackId,
    super.track,
    super.doctorId,
    super.doctor,
    super.projectId,
    super.project,
    super.phoneNumber,
    super.role,
  });

  @override
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      studentId: json['st_ID'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      trackId: json['track_id'],
      countUnits: json['countUnits'],
      //----
      track: json['track'],
      doctorId: json['dr_id'],
      doctor: json['doctor'],
      projectId: json['project_id'],
      project: json['project'],
      phoneNumber: json['phone_num'],
      role: json['role'],
      id: json['id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['st_ID'] = studentId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['countUnits'] = countUnits;
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

  Map<String, dynamic> toJsonBody() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['st_ID'] = studentId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['passwordHash'] = password;
    data['countUnits'] = countUnits;
    data['track_id'] = trackId;
    data['role'] = 'student';
    return data;
  }
}
