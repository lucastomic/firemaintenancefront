import 'package:firemaintenance/http/http_requester.dart';
import 'package:firemaintenance/image_manage/image_uploader/image_uploader_port.dart';
import 'package:firemaintenance/service/authentication/authentication_service.dart';
import 'package:firemaintenance/service/authentication/create_user_request_data.dart';
import 'package:firemaintenance/service/authentication/token_retriever/register_token_retriever.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_tests_service.mocks.dart';

@GenerateMocks([ImageUploader, HTTPRequester, RegisterTokenRetriever])

void main() {
  group('AuthenticationService Tests', () {
    late MockImageUploader mockImageUploader;
    late MockRegisterTokenRetriever mockRegisterTokenRetriever;
    late AuthenticationService authenticationService;

    setUp(() {
      mockImageUploader = MockImageUploader();
      mockRegisterTokenRetriever = MockRegisterTokenRetriever();
      authenticationService = AuthenticationService(mockImageUploader);
    });

    test('registerAndGetToken returns a token', () async {
      when(mockImageUploader.uploadImage(any))
          .thenAnswer((_) async => 'uploaded_image_url');
      when(mockRegisterTokenRetriever.getToken(any))
          .thenAnswer((_) async => 'auth_token');

      var token = await authenticationService.registerAndGetToken(CreateUserRequestData(name: "Jhon Doe", email: "jhondoe@gmail.com", password: "secretPass"));

      expect(token, equals('auth_token'));
    });

  });
}
