import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/colors.dart';
import 'package:wah_app/wahapp/presentation/widgets/const_logo.dart';
import 'package:wah_app/wahapp/presentation/widgets/const_text.dart';
import 'package:wah_app/wahapp/presentation/widgets/custombuttom.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: KColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Center(
            child: Column(
              children: [
                AppLogo(),
                SizedBox(height: 4.h),
                AppText(
                  centerSubText: "your phone number",
                  headingText: "Verify Code",
                  subHeadingText: "Please enter the code we just sent to",
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter code",
                    style: TextStyle(
                      color: KColors.black,
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(height: 1.h),

                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  autoDisposeControllers: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 13.w,
                    fieldWidth: 13.w,
                    activeFillColor: KColors.white,
                    selectedFillColor: KColors.white,
                    inactiveFillColor: KColors.white,
                    activeColor: KColors.primaryOrange,
                    selectedColor: KColors.primaryOrange,
                    inactiveColor: KColors.lightgrey,
                    borderWidth: 2,
                  ),
                  cursorColor: KColors.primaryOrange,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  textStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: KColors.black,
                  ),
                  hintCharacter: '-',
                  hintStyle: TextStyle(color: KColors.lightgrey),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  onCompleted: (value) {
                    log("Entered OTP is: $value");
                  },
                ),
                SizedBox(height: 1.h),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: KColors.black,
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w400,
                    ),
                    children: const [
                      TextSpan(text: "Didn't receive code? "),
                      TextSpan(
                        text: "Resend Code",
                        style: TextStyle(
                          color: KColors.primaryOrange,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: KColors.primaryOrange,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.3.h),
                CustomButton(
                  text: "Verify",
                  onPressed: () {},
                  hasGradient: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
