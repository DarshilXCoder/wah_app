import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/wahapp/controllers/togglebar_controller.dart';
import 'package:wah_app/core/constants/colors.dart';

class ToggleBar extends StatelessWidget {
  ToggleBar({super.key});

  final ToggleBarController controller = Get.put(ToggleBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(1),
      child: Row(
        children: [
          Expanded(child: _buildToggleButton("Phone Number", 0)),
          SizedBox(width: 4),
          Expanded(child: _buildToggleButton("Email Address", 1)),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all(color: KColors.primaryOrange, width: 1.5)
                : Border.all(color: Colors.transparent),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Manrope",
              fontWeight: FontWeight.w600,
              color: isSelected ? KColors.black : KColors.lightgrey,
            ),
          ),
        ),
      );
    });
  }
}
