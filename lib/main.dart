import 'dart:io';

import 'package:av_manage/logic/app_logic.dart';
import 'package:av_manage/router.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerSingletons();
  // HttpOverrides.global = ProxyHttpOverrides();
  // SystemNetworkProxy.init();
  runApp(const MyApp());
  // SystemNetworkProxy.setProxyEnable(true);
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      appWindow
        ..minSize = const Size(640, 360)
        ..size = const Size(720, 540)
        ..alignment = Alignment.center
        ..show();
    });
  }
  await appLogic.bootstrap();
}

void registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Av Manage',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
          useMaterial3: true),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
          useMaterial3: true),
      themeMode: ThemeMode.dark,
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
