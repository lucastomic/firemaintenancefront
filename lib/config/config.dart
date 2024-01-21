import 'package:firemaintenance/widgets/router_screen/router_screen.dart';
import 'package:firemaintenance/widgets/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import '../dependency_injection/injection.dart';
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import '../widgets/authentication_screen/authentication_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'main': (_) =>getIt.get<RouterScreen>(),
  'splash': (_) =>SplashScreen(),
  'login': (_) => AuthenticationScreen.login(getIt.get<ILoginInputFactory>()),
  'register': (_) => AuthenticationScreen.register(getIt.get<IRegisterInputFactory>()),
};

const String initalRoute = 'splash';
ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(210, 186, 96, 0),
    primary: const Color.fromARGB(210, 182, 110, 22),
    onPrimary:const Color.fromARGB(210, 198, 162, 104), //onPrimary is the light version of primary
    error: const Color.fromARGB(255, 185, 12, 0),
  ),
  primaryColor: Colors.white,
  useMaterial3: true,
);

