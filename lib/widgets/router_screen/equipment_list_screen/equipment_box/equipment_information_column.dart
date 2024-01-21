import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:flutter/material.dart';


class EquipmentInformation extends StatelessWidget {
  final Equipment _equipment;
  const EquipmentInformation(this._equipment);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_equipment.name, style: const TextStyle(fontSize: 20),),
          Text(_equipment.type, style: const TextStyle(fontSize: 20),),
          Text(_equipment.lastCheck.toString(), style: const TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
