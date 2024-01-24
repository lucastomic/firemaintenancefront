import 'package:firemaintenance/image_manage/image_picker/image_picker_port.dart';
import 'package:firemaintenance/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:firemaintenance/service/equipment/equipment_service.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/service/profile_photo/profile_photo_service_port.dart';
import 'package:firemaintenance/service/status/status_service.dart';
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_list_screen.dart';
import 'package:firemaintenance/widgets/router_screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'customized_bottom_navigation_bar.dart';

@Injectable()
class RouterScreen extends StatefulWidget {
  final ImageQualityReducer _qualityReducer;
  final ImagePickerPort _imagePicker;
  final IProfilePhotoService _photoService; 
  final EquipmentService _equipmentService;
  final StatusService _statusService;
  final MaintenanceService _maintentanceService;
  const RouterScreen(
    this._maintentanceService,
    this._qualityReducer, 
    this._imagePicker,
    this._statusService,
    this._photoService,
    this._equipmentService
  );


  @override
  State<RouterScreen> createState() => _RouterScreenState();
}

class _RouterScreenState extends State<RouterScreen> {
  late List<Widget> _displayOptions;
  int _index =0;

  @override
  void initState() {
    _initDisplayOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        bottomNavigationBar: CustomizedNaviagtionBar( 
          initialIndex: _index,
          onItemTapped: _onItemTapped,
        ),
        body: SafeArea(child: _displayOptions[_index])
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  void _initDisplayOptions(){
    _displayOptions = [
      EquipmentListScreen(widget._equipmentService, widget._qualityReducer, widget._maintentanceService, widget._statusService),
      ProfileScreen(widget._imagePicker,widget._photoService, widget._maintentanceService)
    ];
  }
}
