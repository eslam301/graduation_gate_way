class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userName;
  final String email;
  final String password;
  final Role role;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userName,
    required this.email,
    required this.password,
    this.role = Role.student
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    phoneNumber: json['phoneNumber'],
    userName: json['userName'],
    email: json['email'],
    password: json['password'],
    role: Role.values.firstWhere((element) => element.name == json['role'])
  );
}

enum Role {
  doctor,
  student
}

extension RoleExtension on Role {
  String get name {
    switch (this) {
      case Role.doctor:
        return 'doctor';
      case Role.student:
        return 'student';
    }
  }
}