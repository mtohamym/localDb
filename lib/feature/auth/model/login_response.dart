class LoginResponse {
  User? user;
  String? token;
  bool? status;

  LoginResponse({this.user, this.token, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    status = json['status'];
  }


}

class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  Null? emailVerifiedAt;
  String? otp;
  Null? avatar;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.emailVerifiedAt,
        this.otp,
        this.avatar,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    otp = json['otp'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
