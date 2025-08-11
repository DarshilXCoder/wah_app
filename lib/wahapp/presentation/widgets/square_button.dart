import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/colors.dart';

class SquareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String image;

  const SquareButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15.w,
      height: 15.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: KColors.lightgrey,
              width: 1.5,
            ), 
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Image.asset(image, scale: 6.sp),
      ),
    );
  }
}
