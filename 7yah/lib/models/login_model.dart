class LoginModel {
  bool? status;
  late String message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  late String name;
  late String email;

  //named constructor

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }
}
