import 'package:av_manage/extension/context_extension.dart';
import 'package:av_manage/pages/cpu_read_page.dart';
import 'package:av_manage/pages/docker_page.dart';
import 'package:av_manage/pages/home.dart';
import 'package:av_manage/pages/setting_page.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPath {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String docker = '/docker';
  static const String cpu = '/cpu';
}

final appRouter = GoRouter(initialLocation: AppPath.splash, routes: [
  GoRoute(
      path: AppPath.splash,
      pageBuilder: (context, state) {
        return CupertinoPage(
            key: state.pageKey,
            child: Scaffold(
              backgroundColor:
                  context.themeData.colorScheme.primary.withOpacity(0.65),
              body: const Center(
                child: FlutterLogo(),
              ),
            ));
      }),
  AppRoute(AppPath.home, (s) => const HomePage()),
  AppRoute(AppPath.setting, (s) => const SettingPage()),
  AppRoute(AppPath.docker, (s) => DockerPage()),
  AppRoute(AppPath.cpu, (s) => CpuReadPage()),
]);

class AppRoute extends GoRoute {
  final bool useFade;

  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
            path: path,
            routes: routes,
            pageBuilder: (context, state) {
              var pageContent = WindowWidget(builder: builder(state));
              if (useFade) {
                return CustomTransitionPage(
                    key: state.pageKey,
                    child: pageContent,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child));
              }
              return CupertinoPage(child: pageContent);
            });
}

class WindowWidget extends StatelessWidget {
  final Widget builder;

  const WindowWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WindowBorder(
        color: context.themeData.primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: WindowTitleBarBox(child: MoveWindow()),
                ),
                Expanded(
                    child: WindowTitleBarBox(
                        child: Row(children: [
                  Expanded(child: MoveWindow()),
                  const WindowButtons()
                ]))),
              ],
            ),
            Expanded(child: builder)
          ],
        ),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
