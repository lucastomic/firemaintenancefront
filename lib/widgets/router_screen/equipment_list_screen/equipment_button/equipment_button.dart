import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/widgets/equipment_screen/equipment_screen.dart';
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_box/equipment_box.dart';
import 'package:flutter/material.dart';

class EquipmentButton extends StatelessWidget {
  final Equipment _equipment;
  final MaintentanceService _maintentanceService;

  final ImageQualityReducer _qualityReducer;
  const EquipmentButton(this._equipment, this._qualityReducer, this._maintentanceService);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: EquipmentBox(_equipment, _qualityReducer),
      onTap: ()=>{
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EquipmentScreen(_equipment, _maintentanceService)))
      },
    );
  }
}