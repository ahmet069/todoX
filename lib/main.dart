import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todox/src/core/config/app_router.dart';
import 'package:todox/src/core/mob_x/bottom_nav_bar_store.dart';
import 'package:todox/src/core/mob_x/task_store.dart';
import 'package:todox/src/core/store/color_palette.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskStore>(create: (_) => TaskStore()),
        Provider<BottomNavBarStore>(create: (_) => BottomNavBarStore())
      ],
      child: MaterialApp.router(
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
            color: ColorPalette.MainBackground,
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            systemOverlayStyle: SystemUiOverlayStyle(
              //<-- SEE HERE
              // Status bar color
              statusBarColor: Color.fromARGB(255, 0, 0, 0),
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
