import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/http/http_request.dart';
import 'package:firemaintenance/http/http_requester.dart';
import 'package:firemaintenance/http/http_response.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'equipment_service.dart';


@Injectable(as: EquipmentService)
class EquipmentServiceImpl implements EquipmentService{
  @override
  Future<List<Equipment>> getAll() async{
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: '/api/v1/equipments');
    HTTPResponse res = await  HTTPRequester.get(req);
    List<dynamic> decoded = json.decode( res.body["message"]);
    return _convertEquipmentListFromJson(decoded);
  }

  List<Equipment> _convertEquipmentListFromJson(List<dynamic> json){
    List<Equipment> response = [];
    for (var element in json) {
      response.add(Equipment.fromJson(element));
    }
    return response;
  }
}