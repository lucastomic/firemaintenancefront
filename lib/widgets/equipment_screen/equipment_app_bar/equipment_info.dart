import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:flutter/material.dart';

class EquipmentInfo extends StatelessWidget {
  final Equipment _user;
  final double _usernameFontSize;
  final double _profileNameFontSize;
  
  EquipmentInfo(
    this._user,
    {double usernameFontSize = 20,
    double profileNameFontSize = 25}
  ):_usernameFontSize = usernameFontSize ,
    _profileNameFontSize = profileNameFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getProfileNameWidget(_user.name), 
        _getUsernameWidget(_user.type),
      ],
    );
  }

  Widget _getUsernameWidget(String username){
    return Text(
      username,
      style: TextStyle(fontSize: _usernameFontSize,),
      textAlign: TextAlign.center,
    );
  }

  Widget _getProfileNameWidget(String name){
    return Text(
      name,
      style: TextStyle(
        fontSize: _profileNameFontSize, 
        fontWeight: FontWeight.bold,
        height: .8
    ),
      textAlign: TextAlign.center,
    );
  }
}
