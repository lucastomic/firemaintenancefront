import 'dart:convert';

import 'package:firemaintenance/exceptions/authentication/bad_credentials_exception.dart';
import 'package:firemaintenance/exceptions/http/server_connection_exception.dart';
import 'package:firemaintenance/http/http_request.dart';
import 'package:firemaintenance/http/http_response.dart';
import 'package:firemaintenance/service/authentication/login_user_request_data.dart';
import 'package:firemaintenance/service/authentication/token_retriever/token_retriever.dart';

class LoginTokenRetriever{
  late final TokenRetriever _tokenRetriever;

  Future<String> getToken(LoginUserRequestData requestData) async {
    _tokenRetriever = TokenRetriever(
      _getRequest(requestData), 
      _getExceptionFromResponse
    );
    return await _tokenRetriever.getToken();
  } 

  HTTPRequest _getRequest(LoginUserRequestData requestData){
    return HTTPRequest.toServer(
      unencodedPath: "/api/v1/login", 
      body: jsonEncode({
        "email": requestData.email, 
        "password": requestData.password, 
      }), 
      headers: {"Content-Type":"application/json"}
    );
  }

  Exception _getExceptionFromResponse(HTTPResponse response){
    if(response.statusIsNotFound)throw BadCredentialsException("No existe ningun usuario con el username proporcionado");
    if(response.statusIsBadRequest)throw BadCredentialsException("Contaseña incorrecta");
    if(response.statusIsUnauthorized)throw BadCredentialsException("Credenciales incorrectas");
    throw ServerConnectionException();
  }
}