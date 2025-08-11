import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/images.dart';
import 'package:wah_app/wahapp/presentation/home/home_page.dart';
import 'package:wah_app/wahapp/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Kimages.splashBgImage),
          Center(
            child: Image.asset(Kimages.logoVert, height: 40.h, width: 40.w),
          ),
        ],
      ),
    );
  }
}
