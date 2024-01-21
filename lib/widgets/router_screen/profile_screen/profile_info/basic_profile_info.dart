import 'package:firemaintenance/domain/user/user.dart';
import 'package:firemaintenance/image_manage/image_picker/image_picker_port.dart';
import 'package:firemaintenance/service/profile_photo/profile_photo_service_port.dart';
import 'package:firemaintenance/widgets/router_screen/profile_screen/profile_info/profile_name_and_username.dart';
import 'package:flutter/material.dart';
import 'photo_button_to_edit_profile.dart';

class BasicProfileInfo extends StatelessWidget {
  final User _user;
  final ImagePickerPort _imagePicker;
  final IProfilePhotoService _photoService;
  const BasicProfileInfo(this._user, this._imagePicker, this._photoService);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PhotoButtonToEditProfile(_user.photo, _imagePicker, _photoService),
        const SizedBox(height: 4,),
        ProfileNameAndUsername(_user,usernameFontSize: 14,profileNameFontSize: 22,),
      ],
    );
  }
}

