class LoginResponse {
  User? user;
  Role? role;

  LoginResponse({this.user, this.role});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    role = fromString(json['role']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['role'] = role;
    return data;
  }
}

class User {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? password;
  String? phoneNum;
  Null doctors;

  User(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.username,
        this.password,
        this.phoneNum,
        this.doctors});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    phoneNum = json['phone_num'];
    doctors = json['doctors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['phone_num'] = phoneNum;
    data['doctors'] = doctors;
    return data;
  }
}

enum Role {
  student,
  doctor,
}

String roleToString(Role role) => role.toString().split('.').last;

Role fromString (String role) {
  switch (role ) {
    case  'doctor':
      return Role.doctor;
    case 'student':
    return Role.student;
    default:
      return Role.student;
  }
}
