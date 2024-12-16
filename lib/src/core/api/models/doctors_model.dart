class DoctorModel {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? userName;

  DoctorModel({this.id, this.fullName, this.email, this.phone, this.userName});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    userName = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['userName'] = userName;
    return data;
  }

  @override
  String toString() {
    return """
    $id,
    $fullName,
    $email,
    $phone,
    $userName,
    """;
  }
}
