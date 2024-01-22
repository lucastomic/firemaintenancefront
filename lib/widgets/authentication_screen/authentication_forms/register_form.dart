// ignore_for_file: use_build_context_synchronously
import 'package:firemaintenance/widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import 'package:firemaintenance/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/authentication/auth_provider.dart';
import '../../../service/authentication/create_user_request_data.dart';
import '../../forms/custom_form.dart';

class RegisterForm extends StatefulWidget {
  final IRegisterInputFactory _inputFactory;
  const RegisterForm(this._inputFactory,);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return CustomForm<String,String>(
        submitButtonText: "Registrarme",
        onSubmit: _onSubmit,
        inputs: _getFormInputsList()
    );
  }

  Future<void> _onSubmit(Map<String, String> inputValues) async{
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    CreateUserRequestData requestData = _createRequest(inputValues);
    await authenticationProvider.register(requestData);
    _moveToMainScreen();
  }

  FormInputsList<String,String> _getFormInputsList(){
    return FormInputsList({
	    "photo": widget._inputFactory.photo(),
      "name": widget._inputFactory.name(),
      "email": widget._inputFactory.email(),
      "password":widget._inputFactory.passaword(),
    });
  }

  CreateUserRequestData _createRequest(Map<String, String> inputValues){
    return CreateUserRequestData(
      name: inputValues["name"],
      photo: inputValues["photo"],
      email: inputValues["email"],
      password: inputValues["password"]
    );
  }

  void _moveToMainScreen(){
    Navigator.of(context).pushNamed("main");
  }
}
