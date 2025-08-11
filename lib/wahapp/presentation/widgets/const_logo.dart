import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Kimages.logoHorz, scale: 8.sp);
  }
}
