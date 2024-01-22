import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/domain/status/status.dart';

abstract class StatusService{
  Future<Status> getLastOne(Equipment equipment);
  Future<List<Status>> getAllFrom(Equipment equipment);
  Future<void> create(Equipment equipment, StatusType status);
}