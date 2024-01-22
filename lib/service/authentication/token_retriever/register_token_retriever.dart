import 'dart:convert';
import 'package:firemaintenance/exceptions/authentication/bad_credentials_exception.dart';
import 'package:firemaintenance/exceptions/http/server_connection_exception.dart';
import 'package:firemaintenance/http/http_request.dart';
import 'package:firemaintenance/http/http_response.dart';
import 'package:firemaintenance/service/authentication/create_user_request_data.dart';

import 'token_retriever.dart';

class RegisterTokenRetriever{
  late final TokenRetriever _tokenRetriever;

  Future<String> getToken(CreateUserRequestData requestData) async {
    _tokenRetriever = TokenRetriever(
      _getRequest(requestData), 
      _getExceptionFromResponse
    );
    return await _tokenRetriever.getToken();
  } 

  HTTPRequest _getRequest(CreateUserRequestData requestData){
    return HTTPRequest.toServer(
      unencodedPath: "/api/v1/register", 
      body: jsonEncode(requestData.toJson()), 
      headers: {"Content-Type":"application/json"}
    );
  }

  Exception _getExceptionFromResponse(HTTPResponse response){
    if(response.statusIsConflict)throw BadCredentialsException("Ese nombre de usuario no esta disponible");
    throw ServerConnectionException();
  }
}