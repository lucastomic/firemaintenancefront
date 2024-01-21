class Maintenance{
  late int _id;
  late String _description;
  late DateTime _date;
  Maintenance.fromJson(Map<String,dynamic> json){
    _description = json["description"];
    _date = DateTime.parse(json["datetime"]) ;
    _id = json["id"];
  }

  DateTime get date{
    return _date;
  }

 String get description{
    return _description;
  }
}