class UserModel {
  String userId = "";
  String firstName = "";
  String lastName = "";
  String dob = "";
  String email = "";
  String userName = "";
  String phoneNumber = "";
  String password = "";

  UserModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.dob,
      required this.email,
      required this.userName,
      required this.phoneNumber,
      required this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"] ?? "";
    lastName = json["lastName"] ?? "";
    dob = json["dob"] ?? "";
    email = json['email'] ?? "";
    userName = json['userName'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    password = json['password'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[userId] = userId;
    data[firstName] = firstName;
    data[lastName] = lastName;
    data[dob] = dob;
    data[email] = email;
    data[userName] = userName;
    data[phoneNumber] = phoneNumber;
    data[password] = password;
    return data;
  }
}
