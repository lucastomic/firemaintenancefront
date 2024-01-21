import 'package:firemaintenance/domain/maintenance/maintenance.dart';
import 'package:flutter/material.dart';

class MaintenanceBox extends StatelessWidget {
  final Maintenance _maintenance;
  MaintenanceBox(this._maintenance,{super.key});

  @override
  Widget build(BuildContext context) {
    return _MaintenanceInfoContainer(
      Column(
        children: [
          Text(_maintenance.date.toString()),
          Text(_maintenance.description)
        ],
      ),
    );
  }
}

class _MaintenanceInfoContainer extends StatelessWidget {
  final Widget _child;
  const _MaintenanceInfoContainer(this._child);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(185, 115, 58, 0.2),
        borderRadius: BorderRadius.circular(20)
      ),
      child: _child
    );
  }
}