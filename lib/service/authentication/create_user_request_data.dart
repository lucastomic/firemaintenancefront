class CreateUserRequestData {
  String? name;
  String? email;
  String? password;
  String? photo;

  CreateUserRequestData({
    this.name,
    this.email,
    this.password,
    this.photo,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "photo": photo,
  };

}
