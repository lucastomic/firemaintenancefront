import 'package:firemaintenance/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:firemaintenance/service/equipment/equipment_service.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/service/status/status_service.dart';
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_list/equipment_list.dart';
import 'package:flutter/material.dart';


class EquipmentListScreen extends StatelessWidget {
  final EquipmentService _equipmentService;
  final ImageQualityReducer _qualityReducer;
  final MaintenanceService _maintentanceService;
  final StatusService _statusService;
  const EquipmentListScreen(this._equipmentService,this._qualityReducer,this._maintentanceService,this._statusService,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Equipamiento", style: TextStyle(fontSize: 25),),
        ),
        EquipmentList(_equipmentService, _qualityReducer, _maintentanceService,_statusService)
      ],
    );
  }
}
