import 'package:firemaintenance/image_manage/image_picker/image_picker_port.dart';
import 'package:firemaintenance/widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import 'package:firemaintenance/widgets/forms/inputs/form_input.dart';
import 'package:firemaintenance/widgets/forms/inputs/photo_selector_input/photo_selector_input.dart';
import 'package:firemaintenance/widgets/forms/inputs/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'validator/input_validator.dart';
import 'login_input_factory.dart';

@Injectable(as:IRegisterInputFactory)
class RegisterInputFactory extends LoginInputFactory implements IRegisterInputFactory{
  final InputValidator _validator;
  final ImagePickerPort _imagePicker;

  RegisterInputFactory(this._validator, this._imagePicker): super(_validator);

  @override
  FormInput<String> phone(){
    return TextFormInput( 
      validate: _validator.mandatoryInputValidation, 
      hintText: '+34 123 321 123',
      labelText: 'Numero de teléfono',
      icon: Icons.phone,
      key: GlobalKey() ,
    );
  } 

  @override
  FormInput<String> photo(){
    return PhotoInputSelctor(_imagePicker);
  }
  
  
  @override
  FormInput<String> name() {
    return TextFormInput( 
      validate: _validator.mandatoryInputValidation, 
      hintText: 'Jhon doe',
      labelText: 'Nombre',
      icon: Icons.abc,
      key: GlobalKey() ,
    );
  }

}