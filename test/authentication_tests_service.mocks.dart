// Mocks generated by Mockito 5.4.2 from annotations
// in firemaintenance/test/authentication_tests_service.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:firemaintenance/http/http_requester.dart' as _i4;
import 'package:firemaintenance/image_manage/image_uploader/image_uploader_port.dart'
    as _i2;
import 'package:firemaintenance/service/authentication_service/create_user_request_data.dart'
    as _i6;
import 'package:firemaintenance/service/authentication_service/token_retriever/register_token_retriever.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ImageUploader].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageUploader extends _i1.Mock implements _i2.ImageUploader {
  MockImageUploader() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> uploadImage(String? imagePath) => (super.noSuchMethod(
        Invocation.method(
          #uploadImage,
          [imagePath],
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [HTTPRequester].
///
/// See the documentation for Mockito's code generation for more information.
class MockHTTPRequester extends _i1.Mock implements _i4.HTTPRequester {
  MockHTTPRequester() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [RegisterTokenRetriever].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterTokenRetriever extends _i1.Mock
    implements _i5.RegisterTokenRetriever {
  MockRegisterTokenRetriever() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> getToken(_i6.CreateUserRequestData? requestData) =>
      (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [requestData],
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}
