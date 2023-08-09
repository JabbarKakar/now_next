import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:now_next/App%20Constants/App%20Images/app_images.dart';
import 'package:now_next/Model%20&%20Boxes/Next%20Model/Next%20Factor%20Model/next_factor_model.dart';
import 'package:now_next/Model%20&%20Boxes/Next%20Model/Next%20Parameter%20Model/next_parameter_model.dart';
import 'package:now_next/Model%20&%20Boxes/Now%20Model/Now%20Factor%20Molel/now_factor_model.dart';
import 'package:now_next/Model%20&%20Boxes/Now%20Model/Now%20Parameter%20Model/next_parameter_model.dart';
import 'package:now_next/Providers/my_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'Views/Splash View/splash_view.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  MyState myState = MyState();

  WidgetsFlutterBinding.ensureInitialized();

  myState.initializeTimezone();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('icon');
  const initializationSettingsIOS = DarwinInitializationSettings();
  const InitializationSettings initializationSettings =
  InitializationSettings(
      android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter<NextFactorModel>(NextFactorModelAdapter());
  await Hive.openBox<NextFactorModel>('NextFactorBox');

  Hive.registerAdapter<NextParameterModel>(NextParameterModelAdapter());
  await Hive.openBox<NextParameterModel>('NextParameterBox');

  Hive.registerAdapter<NowFactorModel>(NowFactorModelAdapter());
  await Hive.openBox<NowFactorModel>('NowFactorBox');

  Hive.registerAdapter<NowParameterModel>(NowParameterModelAdapter());
  await Hive.openBox<NowParameterModel>('NowParameterBox');

  runApp(
      ChangeNotifierProvider(
          create: (_) => MyState(),
      child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Now Next',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const SplashView(),
        );
      },
    );
  }

}

