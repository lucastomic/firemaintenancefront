// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../image_manage/image_picker/image_picker.dart' as _i8;
import '../image_manage/image_picker/image_picker_port.dart' as _i7;
import '../image_manage/image_quality_reducer/cloudinary_image_quality_reducer.dart'
    as _i10;
import '../image_manage/image_quality_reducer/image_quality_reducer.dart'
    as _i9;
import '../image_manage/image_uploader/cloudinary_image_uploader.dart' as _i12;
import '../image_manage/image_uploader/image_uploader_port.dart' as _i11;
import '../local_storage/local_storage.dart' as _i6;
import '../local_storage/local_storage_port.dart' as _i5;
import '../service/authentication/authentication_service.dart' as _i17;
import '../service/authentication/port/authentication_service.dart' as _i16;
import '../service/equipment/equipment_service.dart' as _i3;
import '../service/equipment/equipment_service_impl.dart' as _i4;
import '../service/maintenance/maintenanceServiceImpl.dart' as _i15;
import '../service/maintenance/maintentanceService.dart' as _i14;
import '../service/profile_photo/profile_photo_service.dart' as _i21;
import '../service/profile_photo/profile_photo_service_port.dart' as _i20;
import '../widgets/authentication_screen/authentication_forms/input_factory/login_input_factory.dart'
    as _i19;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart'
    as _i18;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart'
    as _i22;
import '../widgets/authentication_screen/authentication_forms/input_factory/register_input_factory.dart'
    as _i23;
import '../widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart'
    as _i13;
import '../widgets/router_screen/router_screen.dart' as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.EquipmentService>(() => _i4.EquipmentServiceImpl());
    gh.factory<_i5.IAuthenticationLocalStorage>(
        () => _i6.AuthenticationLocalStorage());
    gh.factory<_i7.ImagePickerPort>(() => _i8.ImagePickerImpl());
    gh.factory<_i9.ImageQualityReducer>(
        () => _i10.CloudinaryImageQualityReducer());
    gh.factory<_i11.ImageUploader>(() => _i12.CloudinaryImageUploader());
    gh.factory<_i13.InputValidator>(() => _i13.InputValidator());
    gh.factory<_i14.MaintentanceService>(() => _i15.MaintenanceServiceImpl());
    gh.factory<_i16.IAuthenticationService>(
        () => _i17.AuthenticationService(gh<_i11.ImageUploader>()));
    gh.factory<_i18.ILoginInputFactory>(
        () => _i19.LoginInputFactory(gh<_i13.InputValidator>()));
    gh.factory<_i20.IProfilePhotoService>(
        () => _i21.ProfilePhotoService(gh<_i11.ImageUploader>()));
    gh.factory<_i22.IRegisterInputFactory>(() => _i23.RegisterInputFactory(
          gh<_i13.InputValidator>(),
          gh<_i7.ImagePickerPort>(),
        ));
    gh.factory<_i24.RouterScreen>(() => _i24.RouterScreen(
          gh<_i14.MaintentanceService>(),
          gh<_i9.ImageQualityReducer>(),
          gh<_i7.ImagePickerPort>(),
          gh<_i20.IProfilePhotoService>(),
          gh<_i3.EquipmentService>(),
        ));
    return this;
  }
}
