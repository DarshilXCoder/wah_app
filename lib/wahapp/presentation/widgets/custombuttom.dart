import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool hasGradient;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.hasGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.h,
      child: Container(
        decoration: hasGradient
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [KColors.primaryOrange, KColors.primaryYellow],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 0.7],
                ),
                borderRadius: BorderRadius.circular(15),
              )
            : BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: "Manrope",
              fontWeight: FontWeight.w600,
              color: KColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
