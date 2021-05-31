class LoginParameter {
  String? email;
  String? password;

  LoginParameter({
    required this.email,
    required this.password,
  });

  factory LoginParameter.fromJson(Map<String, dynamic> json) => LoginParameter(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
