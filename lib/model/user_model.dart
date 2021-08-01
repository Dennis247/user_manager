class UserModel {
  String firstName = "";
  String lastName = "";

  String email = "";
  String userName = "";
  String phoneNumber = "";
  String password = "";

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.userName,
      required this.phoneNumber,
      required this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"] ?? "";
    lastName = json["lastName"] ?? "";

    email = json['email'] ?? "";
    userName = json['userName'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    password = json['password'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
