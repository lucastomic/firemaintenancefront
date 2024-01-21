import 'package:injectable/injectable.dart';

@Injectable()
class InputValidator{
  String? mandatoryInputValidation(String? value){
    if(value == null || value =="") return "Este campo es obligatorio";
    return null;
  }

  String? emailValidation(String? value){
    String? mandatoryValidation = mandatoryInputValidation(value);
    if(mandatoryValidation != null) return mandatoryValidation;   
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return regex.hasMatch(value!) ? null : "Formato de email invalido";
  }

  String? minimumLengthValidation(String? value){
    String? mandatoryValidation = mandatoryInputValidation(value);
    if(mandatoryValidation != null) return mandatoryValidation;
    if(value!.length < 6) return "La contraseña debe tener al menos 6 caracteres";
    return null;
  }
}