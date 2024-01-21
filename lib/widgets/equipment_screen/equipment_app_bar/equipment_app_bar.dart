import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:flutter/material.dart';

import 'equipment_info.dart';

class EquipmentAppBar extends StatelessWidget {
  final Equipment _user; 
  final double _maxHeight = 240.0;
  const EquipmentAppBar(this._user);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( 
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: _maxHeight,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: _AppBarTitle(_user),
        background: _getBackground(),
      )
    );
  }

  Widget _getBackground(){
    return Padding(
      padding: const EdgeInsets.only(bottom:40.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: FittedBox(
          fit:BoxFit.cover,   
          child: Image.network(_user.photo)
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final Equipment _user; 
  const _AppBarTitle(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: _getBoxDecoration(context),
      child: EquipmentInfo(
        _user,
        usernameFontSize: 10,
        profileNameFontSize: 13,
      )
    );
  }

  BoxDecoration _getBoxDecoration(BuildContext context){
    return BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(15),
      boxShadow: _getBoxShadows()
    );
  }

  List<BoxShadow> _getBoxShadows(){
    return [BoxShadow(color: Colors.black.withOpacity(.3), offset: Offset(3, 3), blurRadius: .5)];
  }
}
