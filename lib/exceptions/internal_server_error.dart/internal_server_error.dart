import '../exception_with_message.dart';

class InternalServerErrorException extends ExceptionWithMessage{
  InternalServerErrorException():super("Lo sentimos. Parece que algo ha fallado, intente de nuevo más tarde.");
}