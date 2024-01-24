import 'package:firemaintenance/domain/status/status.dart';
import 'package:firemaintenance/widgets/equipment_screen/status_box/status_box.dart';
import 'package:firemaintenance/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class FutureStatusBox extends StatelessWidget {
  Future<Status> _future;
  FutureStatusBox(this._future,{super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (_, AsyncSnapshot<dynamic> snapshot){
        if(snapshot.hasData){
          return StatusBox(snapshot.data);
        }else{
          return const CentredCircularProgressIndicator();
        }
      }
    );
  }
}