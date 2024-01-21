import '../../../../forms/inputs/form_input.dart';
import 'login_input_factory_port.dart';

abstract class IRegisterInputFactory extends ILoginInputFactory{
  FormInput<String> name();
  FormInput<String> phone();
  FormInput<String> photo();
}