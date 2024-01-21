class Equipment{
  late String name;
  late int id;
  late String type;
  late String photo;
  DateTime? lastCheck;

  Equipment({required this.id,required this.name,required this.type,required this.lastCheck, required this.photo});

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id']!;
    photo = json['photo'];
    name = json['name'];
    type = json['type'];
  }
}