import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/wahapp/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashPage,
          getPages: AppRoutes.pages,
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
