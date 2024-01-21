import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:firemaintenance/service/equipment/equipment_service.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_button/equipment_button.dart';
import 'package:firemaintenance/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class EquipmentList extends StatelessWidget {
  final EquipmentService _equipmentService;
  final ImageQualityReducer _qualityReducer;
  final MaintentanceService _maintentanceService;
  const EquipmentList(this._equipmentService,this._qualityReducer,this._maintentanceService,{super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _equipmentService.getAll(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        if(snapshot.hasData){
          return _EquipmentsListBuilder(snapshot.data, _qualityReducer, _maintentanceService);
        }else{
          return const CentredCircularProgressIndicator();
        }
      },
    );
  }
}

class _EquipmentsListBuilder extends StatelessWidget {
  final List<Equipment> _list;
  final MaintentanceService _maintentanceService;
  final ImageQualityReducer _qualityReducer;
  const _EquipmentsListBuilder(this._list, this._qualityReducer, this._maintentanceService);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, 
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int i){
        return EquipmentButton(_list[i], _qualityReducer, _maintentanceService);
      }
    );
  }
}