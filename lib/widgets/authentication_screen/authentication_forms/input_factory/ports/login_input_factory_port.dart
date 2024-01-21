import 'package:firemaintenance/widgets/forms/inputs/form_input.dart';

abstract class ILoginInputFactory{
  FormInput<String> email();
  FormInput<String> passaword();
}