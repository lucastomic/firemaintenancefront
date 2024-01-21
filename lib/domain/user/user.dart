class User {
  late int id;
  late String name;
  late String email;
  late String photo;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
  });
  User.fromJson(Map<String, dynamic> json) {
    Map<String,dynamic> userString = json["user"];
    id = userString['id']!;
    photo = userString['photo'];
    email = userString['email'];
    name = userString['name'];
  }
}
