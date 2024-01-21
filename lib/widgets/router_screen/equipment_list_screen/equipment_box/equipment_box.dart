import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_box/presentation_image/user_box_presentation_image.dart';
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_box/equipment_information_column.dart';
import 'package:flutter/material.dart';

class EquipmentBox extends StatefulWidget {
  final Equipment _equipment;
  final ImageQualityReducer _qualityReducer;

  const EquipmentBox(this._equipment,this._qualityReducer);

  @override
  State<EquipmentBox> createState() => _EquipmentBoxState();
}

class _EquipmentBoxState extends State<EquipmentBox> {
  final double height = 150;
  late String presentationImageWithQualityReduced; 
  @override
  void initState() {
    String presentationImage = widget._equipment.photo;
    presentationImageWithQualityReduced = widget._qualityReducer.getURLWithReducedQuality(presentationImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: _getDecoration(),
      margin: _getMargin(),
      child: Row(
        children: [
          EquipmentBoxPresentationImage(presentationImageWithQualityReduced), 
          EquipmentInformation(widget._equipment)
        ],
      ),
    );
  }

  EdgeInsetsGeometry _getMargin() {
    return const EdgeInsets.only(bottom: 20, left: 25, right: 25);
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(width: .3, color: Colors.black45)
    );
  }
}
