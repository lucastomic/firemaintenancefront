import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/domain/status/status.dart';
import 'package:firemaintenance/service/status/status_service.dart';
import 'package:firemaintenance/widgets/equipment_screen/status_box/status_box.dart';
import 'package:firemaintenance/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class StatusesScreen extends StatelessWidget {

  final StatusService _statusService;
  final Equipment _equipment;
  StatusesScreen(this._equipment,this._statusService,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future:  _statusService.getAllFrom(_equipment), 
          builder: (BuildContext context, AsyncSnapshot<List<Status>> snapshot) { 
            if(snapshot.hasData){
              return Column(
                children: [
                  const Text("Historial de estados de ", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  Text(_equipment.name, textAlign: TextAlign.center,),
                  _StatusesList(snapshot.data!),
                ],
              );
            }{  
              return const CentredCircularProgressIndicator();
            }
          
          },
        ),
      ),
    );
  }
}

class _StatusesList extends StatelessWidget {
  final List<Status> _statuses;
  _StatusesList(this._statuses);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _statuses.length,
        itemBuilder: (BuildContext context, int index) { 
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StatusBox(_statuses[index]),
          );
        },
      ),
    );
  }
}

