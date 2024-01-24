import 'dart:convert';

import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/domain/maintenance/maintenance.dart';
import 'package:firemaintenance/http/http_request.dart';
import 'package:firemaintenance/http/http_requester.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:injectable/injectable.dart';

import '../../http/http_response.dart';

@Injectable(as:MaintenanceService)
class MaintenanceServiceImpl implements MaintenanceService{
  @override
  Future<List<Maintenance>> getDoneByAuthenticated() async{
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: "/api/v1/maintenances",);
    HTTPResponse res = await HTTPRequester.get(req);
    List<dynamic> decoded = jsonDecode(res.body["message"]);
    return _parseMaintenanceList(decoded);
  }

  @override
  Future<List<Maintenance>> getFrom(Equipment equipment) async {
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: "/api/v1/equipment/${equipment.id}/maintenances",);
    HTTPResponse res = await HTTPRequester.get(req);
    List<dynamic> decoded = jsonDecode(res.body["message"]);
    return _parseMaintenanceList(decoded);
  }

  @override
  Future<void> maintain(Equipment equipment) async  {
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: "/api/v1/equipment/${equipment.id}/maintenance",);
    await HTTPRequester.post(req);
  }

  List<Maintenance> _parseMaintenanceList(List<dynamic> json){
    List<Maintenance> res = [];
    for (var element in json) {
      res.add(Maintenance.fromJson(element));
    }
    return res;
  }

}