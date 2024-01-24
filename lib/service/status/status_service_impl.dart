import 'dart:collection';
import 'dart:convert';

import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/domain/status/status.dart';
import 'package:firemaintenance/http/http_request.dart';
import 'package:firemaintenance/http/http_requester.dart';
import 'package:firemaintenance/service/status/status_service.dart';
import 'package:injectable/injectable.dart';

import '../../http/http_response.dart';

@Injectable(as:StatusService)
class StatusServiceImpl implements StatusService{
  @override
  Future<void> create(Equipment equipment, StatusType status) async {
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: "/api/v1/equipment/${equipment.id}/status",body: {"status":status.name});
    await HTTPRequester.post(req);
  }

  @override
  Future<List<Status>> getAllFrom(Equipment equipment) async {
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: "/api/v1/equipment/${equipment.id}/statuses",);
    HTTPResponse res = await HTTPRequester.get(req);
    List<dynamic> decoded = jsonDecode(res.body["message"]);
    return _parseStatusList(decoded);
  }

  @override
  Future<Status> getLastOne(Equipment equipment) async {
    HTTPRequest req = HTTPRequest.toServer(unencodedPath: "/api/v1/equipment/${equipment.id}/lastStatus",);
    HTTPResponse res = await HTTPRequester.get(req);
    return Status.fromJson(res.body);

  }

  List<Status> _parseStatusList(List<dynamic> json){
    List<Status> res = [];
    for (var element in json) {
      res.add(Status.fromJson(element));
    }
    return res;
  }


}