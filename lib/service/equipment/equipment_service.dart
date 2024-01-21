import 'package:firemaintenance/domain/equipment/equipment.dart';

abstract class EquipmentService{
  Future<List<Equipment>> getAll();
}