import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/colors.dart';

class AppText extends StatelessWidget {
  final String headingText;
  final String subHeadingText;
  final String centerSubText;
  const AppText({
    super.key,
    required this.headingText,
    required this.subHeadingText,
    required this.centerSubText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headingText,
          style: TextStyle(
            fontSize: 20.sp,
            color: KColors.black,
            fontFamily: "Manrope",
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 1.h),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 16.sp,
              color: KColors.lightgrey,
              fontFamily: "Manrope",
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(text: "$subHeadingText \n"),
              TextSpan(text: centerSubText),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
