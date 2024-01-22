import 'dart:ui';

import 'package:flutter/material.dart';

class Status {
  final int id;
  final DateTime datetime;
  final StatusType status;

  Status({
    required this.id,
    required this.datetime,
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      datetime: DateTime.parse(json['datetime']),
      status: StatusType.values.byName(json['status'])
    );
  }

  Color get color{
    return status._color;
  }
}

enum StatusType{
  ok(Colors.green),notOk(Colors.red);

  const StatusType(this._color);
  final Color _color;

  Color get color{
    return _color;
  }
}