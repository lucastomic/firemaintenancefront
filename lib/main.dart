import 'package:firemaintenance/local_storage/local_storage_port.dart';
import 'package:firemaintenance/provider/authentication/auth_provider.dart';
import 'package:firemaintenance/service/authentication/port/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'dependency_injection/injection.dart';
import 'config/environment.dart';

void main() async {
  configureDependencies();
  await loadEnviroments();

  runApp(MultiProvider(
    providers: [  
      ChangeNotifierProvider(create: (_) => AuthenticationProvider(getIt.get<IAuthenticationService>(),getIt.get<IAuthenticationLocalStorage>())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: themeData,
      routes: routes,
      initialRoute: initalRoute,
    );
  }
}

