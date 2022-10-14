import 'package:desktop_app/src/pages/clever_island.dart';
import 'package:desktop_app/src/widget/appbar.dart';
import 'package:desktop_app/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udisdk/udisdk.dart';

import 'env/env.dart';
import 'src/widget/checking_animation.dart';
import 'src/widget/global_box_manager.dart';

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

  Future<String> _incrementCounter() async {
    final client = NativeUdiClient(
        defaultToken: 'xZLhYklgNNuWGNI3wvvx8Cc9db28BgaguVU33_jlDgCH4oxj4g==');
    // setState(() {
    //   _counter++;
    // });
    // Process.start('ncpa.cpl', [], runInShell: true);
    // for (int i = 0; i < 10; i++) {
    final response = await client.get('/v1/ups/internal/information');
    // print(jsonDecode(response.body));
    // final response = await client.post(
    //   '/v1/launcher/service/systemupgradenotify',
    //   jsonEncode({'appId': 'com', 'upgradeCount': 0}),
    // );
    // debugPrint('response: $response');
    // }
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(child: CleverIsland(),
      ),
    );
  }
}
