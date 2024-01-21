import 'package:firemaintenance/provider/authentication/auth_provider.dart';
import 'package:firemaintenance/widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import 'package:firemaintenance/widgets/forms/custom_form.dart';
import 'package:firemaintenance/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget{
  final ILoginInputFactory _inputFactory;
  LoginForm(this._inputFactory);

  @override
  Widget build(BuildContext context) {
    return CustomForm<String,String>(
      submitButtonText: "Ingresar",
      onSubmit: (Map<String,String> inputValues) async{  
        AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
        await authenticationProvider.logIn(
          inputValues["email"]!, 
          inputValues["password"]!
        );
        Navigator.of(context).pushNamed("main");
      }, 
      inputs: _getFormInputsList()
    );
  }


  FormInputsList<String,String> _getFormInputsList(){
    return FormInputsList<String,String>({
      "email": _inputFactory.email(),
      "password":_inputFactory.passaword(),
    });
  }
}
