import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/widgets/equipment_screen/equipment_app_bar/equipment_app_bar.dart';
import 'package:firemaintenance/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import '../maintenance_list/maintenance_list.dart';

class EquipmentScreen extends StatefulWidget {
  final Equipment _equipment;
  final MaintentanceService _maintentanceService;
  const EquipmentScreen(this._equipment,this._maintentanceService,{super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EquipmentAppBar(widget._equipment),  
          _SubTitle("Mantenimiento"),
          SliverToBoxAdapter(
            child: SizedBox(
              height:300,
              child: FutureMaintenanceList(widget._maintentanceService.getFrom(widget._equipment))
            )
          ),
          SliverToBoxAdapter(child: DecoratedButton.hollow(
              context: context, 
              text: "Dar mantenimiento",
              onPressed: _maintainEquipment,
            ),
          ),
        ],
      ),
    );
  }

  void _maintainEquipment() async {
    await widget._maintentanceService.maintain(widget._equipment);
    setState(() {  });
  }
}

class _SubTitle extends StatelessWidget {
  final String _text;
  _SubTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_text,textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),),
      ),
    );
  }
}
