import 'package:graduation_gate_way/src/core/api/models/user.dart';

class DoctorModel extends User {
  String? fullName;

  DoctorModel({
    this.fullName,
    super.id,
    super.firstname,
    super.lastname,
    super.email,
    super.username,
    super.doctorId,
    super.doctor,
    super.password,
    super.track,
    super.trackId,
    super.project,
    super.projectId,
    super.phoneNumber,
    super.role,
    super.countUnits,
  });

  @override
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      fullName: json['fullname'],
      email: json['email'],
      username: json['username'] ?? json['userName'],
      doctorId: json['dr_id'],
      doctor: json['doctor'],
      password: json['password'],
      track: json['track'],
      trackId: json['track_id'],
      project: json['project'],
      projectId: json['project_id'],
      phoneNumber: json['phone_num'],
      role: json['role'],
      countUnits: json['count_units'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['dr_id'] = doctorId;
    data['doctor'] = doctor;
    data['password'] = password;
    data['track'] = track;
    data['track_id'] = trackId;
    data['project'] = project;
    data['project_id'] = projectId;
    data['phone_num'] = phoneNumber;
    data['role'] = role;
    data['count_units'] = countUnits;
    return data;
  }

  Map<String, dynamic> toJsonBody() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['phone_num'] = phoneNumber;
    // data['role'] = 'doctor';
    return data;
  }
}
