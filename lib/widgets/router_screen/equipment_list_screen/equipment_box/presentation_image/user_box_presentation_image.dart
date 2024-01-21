// ignore_for_file: use_key_in_widget_constructors
import 'package:firemaintenance/widgets/router_screen/equipment_list_screen/equipment_box/presentation_image/resized_image_from_url.dart';
import 'package:flutter/material.dart';

class EquipmentBoxPresentationImage extends StatefulWidget {
  final String _imageUrl;

  const EquipmentBoxPresentationImage(this._imageUrl);

  @override
  State<EquipmentBoxPresentationImage> createState() => _EquipmentBoxPresentationImageState();
}

class _EquipmentBoxPresentationImageState extends State<EquipmentBoxPresentationImage> {
  final double _borderRadius = 15;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _getBorderRadius(), 
      child: ResizedImageWithLoading(widget._imageUrl)
    );
  }

  BorderRadius _getBorderRadius() {
    return BorderRadius.horizontal(left: Radius.circular(_borderRadius));
  }
}