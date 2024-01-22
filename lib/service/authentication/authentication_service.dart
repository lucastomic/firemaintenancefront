import 'package:firemaintenance/domain/user/user.dart';
import 'package:firemaintenance/http/http_request.dart';
import 'package:firemaintenance/http/http_requester.dart';
import 'package:firemaintenance/image_manage/image_uploader/image_uploader_port.dart';
import 'package:firemaintenance/service/authentication/create_user_request_data.dart';
import 'package:firemaintenance/service/authentication/login_user_request_data.dart';
import 'package:firemaintenance/service/authentication/port/authentication_service.dart';
import 'package:firemaintenance/service/authentication/token_retriever/login_token_retriever.dart';
import 'package:injectable/injectable.dart';

import 'token_retriever/register_token_retriever.dart';

@Injectable(as: IAuthenticationService)
class AuthenticationService extends IAuthenticationService {
  final ImageUploader _imageUploader;
  AuthenticationService(this._imageUploader);

  @override
  Future<String> registerAndGetToken(CreateUserRequestData requestData) async {
    requestData.photo = await _uploadUserPhoto(requestData);
    RegisterTokenRetriever registerTokenRetriever = RegisterTokenRetriever();
    String authenticationToken = await registerTokenRetriever.getToken(requestData);
    return authenticationToken; 
  }

  @override
  Future<String> tokenFromLogin(LoginUserRequestData requestData) async {
    LoginTokenRetriever loginTokenRetriever = LoginTokenRetriever();
    String authenticationToken = await loginTokenRetriever.getToken(requestData);
    return authenticationToken;
  } 

  @override
  Future<User> getUserFromToken(String token)async {
    HTTPRequest request = HTTPRequest.toServer(unencodedPath: "/api/v1/user");
    Map<String, dynamic> response = (await HTTPRequester.get(request)).body;
    return User.fromJson(response);
  }

  Future<String> _uploadUserPhoto(CreateUserRequestData requestData)async{
    return await _imageUploader.uploadImage(requestData.photo!);
  }
}
 