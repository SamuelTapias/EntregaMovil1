class UserInfo {
  final String token;
  final String username;
  final String name;
  final String email;

  UserInfo({this.token, this.username, this.name, this.email});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      token: json['token'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }

  String prn(){
    return ""+ name+" "+email+" "+username; 
  }
}

class Validation {
  final bool valid;

  Validation({this.valid});

  factory Validation.fromJson(Map<String, dynamic> json) {
    return Validation(
      valid: json['valid'],
    );
  }
}