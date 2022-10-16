import 'package:desktop_app/src/pages/clever_island.dart';
import 'package:desktop_app/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'env/env.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.initWindow(args);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(298, 30),
      app2screenWithWidth: 0.155,
      builder: (context, Widget? child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CleverIsland(),
      ),
    );
  }
}
