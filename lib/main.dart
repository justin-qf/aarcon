import 'package:aarcon/Controllers/InternetController.dart';
import 'package:aarcon/Core/colors_constant.dart';
import 'package:aarcon/Services/connectivity_service.dart';
import 'package:aarcon/Views/SplashScreen.dart';
import 'package:aarcon/config/statusbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ConnectivityService()).startMonitoring();
    Get.lazyPut<InternetController>(() => InternetController());
    Statusbar().trasparent_statusbar();
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          title: "AARCON",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true, colorSchemeSeed: primaryColor),
          home: const Splashscreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          defaultTransition: Transition.rightToLeftWithFade);
    });
  }
}
