import '../exception_with_message.dart';

class InternetConnectionException extends ExceptionWithMessage{
  InternetConnectionException():super("Por favor, revise su conección a internet");
}