import 'package:firemaintenance/domain/status/status.dart';
import 'package:flutter/material.dart';

class StatusBox extends StatelessWidget {
  final Status _status;
  StatusBox(this._status);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: _status.color.withOpacity(.4),
        borderRadius: BorderRadius.circular(30)
      ),
      child:Column(
        children: [
          Text(_status.datetime.toString().substring(0,19)),
          Text(_status.status.name),
        ],
      )
    );
  }
}