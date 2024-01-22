import 'dart:async';

import 'package:firemaintenance/http/http_requester.dart';
import 'package:firemaintenance/service/authentication/create_user_request_data.dart';
import 'package:firemaintenance/service/authentication/port/authentication_service.dart';
import 'package:flutter/material.dart';

import '../../domain/user/user.dart';
import '../../local_storage/local_storage_port.dart';
import '../../service/authentication/login_user_request_data.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _authenticatedUser;
  String? _authenticationToken;
  final IAuthenticationLocalStorage _localStorage;
  final IAuthenticationService _authenticationService;


  AuthenticationProvider(this._authenticationService, this._localStorage);

  Future<void> authenticateFromLocalStorage() async {
    _authenticationToken = await _localStorage.getAuthToken();
    if(_authenticationToken != null) await _authenticate(_authenticationToken!);
  }

  Future<void> logIn(String email, String password) async {
    LoginUserRequestData requestData = LoginUserRequestData(email: email, password: password);
    _authenticationToken = await _authenticationService.tokenFromLogin(requestData);
    await _authenticate(_authenticationToken!);
  }

  void logOut(){
    _authenticationToken = null;
    _authenticatedUser = null;
    HTTPRequester.cleanAuthenticationToken();
    _localStorage.cleanAuthToken();
  }

  Future<void> register(CreateUserRequestData requestData) async {
    _authenticationToken = await _authenticationService.registerAndGetToken(requestData);
    await _authenticate(_authenticationToken!);
  }

  Future<void> refreshUser() async {
    _authenticatedUser = await _authenticationService.getUserFromToken(_authenticationToken!);
  }

  User get authenticatedUser {
    assert(_authenticationToken !=null, "There is no authentitcated user");
    return _authenticatedUser!;
  }

  String get authenticationToken {
    assert(_authenticationToken !=null, "There is no authentitcated user");
    return _authenticationToken!;
  }

  bool get isCurrentlyAuthenticated{
    return _authenticatedUser != null;
  }


  bool isUserAuthenticated(User user){
    return _authenticatedUser!.id == user.id;
  }


  void setPhoto(String imageURL){
    _authenticatedUser!.photo = imageURL;
    notifyListeners();
  }

  Future<void> _authenticate(String token) async {
    await _localStorage.setAuthToken(token);
    HTTPRequester.authenticationToken = token;
    _authenticatedUser = await _authenticationService.getUserFromToken(_authenticationToken!);
  }
}
