import 'package:graduation_gate_way/src/core/api/models/user.dart';

class LoginResponse {
  User? user;
  String? role;

  LoginResponse({this.user, this.role});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['role'] = role;
    return data;
  }

  @override
  String toString() {
    return 'LoginResponse{user: $user, role: $role}';
  }
}
