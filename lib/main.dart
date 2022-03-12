import 'package:fetch/Constance/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Binding/binding.dart';
import 'Widgets/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: backGround,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light))),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingController(),
      home: const HomeLayout(),
    );
  }
}
