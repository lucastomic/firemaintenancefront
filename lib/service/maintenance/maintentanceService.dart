import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/domain/maintenance/maintenance.dart';

abstract class MaintentanceService{
  Future<void> maintain(Equipment equipment);  
  Future<List<Maintenance>> getFrom(Equipment equipment);  
  Future<List<Maintenance>> getDoneByAuthenticated();  
}