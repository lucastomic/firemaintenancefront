import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/service/status/status_service.dart';
import 'package:firemaintenance/widgets/status_screen/status_screen.dart';
import 'package:firemaintenance/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

class StatusesButton extends StatelessWidget {
  final StatusService _statusService;
  final Equipment _equipment;
  const StatusesButton(  this._statusService, this._equipment);

  @override
  Widget build(BuildContext context) {
    return DecoratedButton.hollow(
        context: context,
        text: "Ver historial",
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) { return StatusesScreen(_equipment,_statusService); }));
        },
    );
  }
}