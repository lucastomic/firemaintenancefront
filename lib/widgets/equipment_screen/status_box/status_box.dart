import 'package:firemaintenance/domain/status/status.dart';
import 'package:flutter/material.dart';

class StatusBox extends StatelessWidget {
  final Status _status;
  StatusBox(this._status);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _status.color,
      ),
      child:Column(
        children: [
          Text(_status.datetime.toString()),
          Text(_status.status.toString()),
        ],
      )
    );
  }
}