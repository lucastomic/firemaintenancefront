import 'package:firemaintenance/domain/maintenance/maintenance.dart';
import 'package:firemaintenance/domain/user/user.dart';
import 'package:firemaintenance/image_manage/image_picker/image_picker_port.dart';
import 'package:firemaintenance/provider/authentication/auth_provider.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/service/profile_photo/profile_photo_service_port.dart';
import 'package:firemaintenance/widgets/equipment_screen/maintenance_box/maintenance_box.dart';
import 'package:firemaintenance/widgets/maintenance_list/maintenance_list.dart';
import 'package:firemaintenance/widgets/router_screen/profile_screen/buttons/log_out_button.dart';
import 'package:firemaintenance/widgets/router_screen/profile_screen/profile_info/basic_profile_info.dart';
import 'package:firemaintenance/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  final ImagePickerPort _imagePickerPort;
  final IProfilePhotoService _photoService;
  final MaintenanceService _maintentanceService;
  ProfileScreen(this._imagePickerPort,this._photoService, this._maintentanceService);

  late User user;

  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthenticationProvider>().authenticatedUser;
    return SafeArea(
      child: CustomScrollView(  
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  BasicProfileInfo(user,_imagePickerPort,_photoService),
                  Expanded(
                    child: FutureMaintenanceList(_maintentanceService.getDoneByAuthenticated())
                  ),
                  const LogOutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

