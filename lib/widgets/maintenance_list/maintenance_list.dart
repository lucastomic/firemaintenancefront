import 'package:firemaintenance/domain/maintenance/maintenance.dart';
import 'package:firemaintenance/widgets/equipment_screen/maintenance_box/maintenance_box.dart';
import 'package:firemaintenance/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class FutureMaintenanceList extends StatelessWidget {
  final Future<List<Maintenance>> _futureMaintenance;
  const FutureMaintenanceList(this._futureMaintenance);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Maintenance>>(
      future: _futureMaintenance,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const CentredCircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index){
            int indexStartingFromLast = _getIndexStartingFromLast(index, snapshot.data.length);
            return MaintenanceBox(snapshot.data[indexStartingFromLast]);
          },
        );
      },
    );
  }

  int _getIndexStartingFromLast(int index, int size){
    return size - 1 - index;
  }
}

