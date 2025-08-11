import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/images.dart';
import 'package:wah_app/wahapp/controllers/togglebar_controller.dart';
import 'package:wah_app/wahapp/controllers/auth_controller.dart'; // Make sure this path is correct
import 'package:wah_app/wahapp/presentation/pages/auth/otp_verification_page.dart';
import 'package:wah_app/core/constants/colors.dart';
import 'package:wah_app/wahapp/presentation/widgets/const_logo.dart';
import 'package:wah_app/wahapp/presentation/widgets/const_text.dart';
import 'package:wah_app/wahapp/presentation/widgets/custombuttom.dart';
import 'package:wah_app/wahapp/presentation/widgets/square_button.dart';
import 'package:wah_app/wahapp/presentation/widgets/toggle_bar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final ToggleBarController toggleController = Get.put(ToggleBarController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: KColors.white),
      backgroundColor: KColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppLogo(),
                SizedBox(height: 4.h),
                AppText(
                  centerSubText: "access to Wah!",
                  headingText: "Welcome",
                  subHeadingText: "Please login and enjoy seamless",
                ),
                SizedBox(height: 3.h),
                ToggleBar(),
                SizedBox(height: 2.h),
                Obx(() {
                  if (toggleController.selectedIndex.value == 0) {
                    return SizedBox(
                      width: double.infinity,
                      child: IntlPhoneField(
                        disableLengthCheck: true,
                        decoration: InputDecoration(
                          labelText: "Phone Number*",
                          hintText: "",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          floatingLabelStyle: WidgetStateTextStyle.resolveWith((
                            states,
                          ) {
                            if (states.contains(WidgetState.focused)) {
                              return TextStyle(color: KColors.primaryOrange);
                            }
                            return TextStyle(color: KColors.black);
                          }),
                          labelStyle: TextStyle(
                            color: KColors.lightgrey,
                          ), // label color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: KColors.lightgrey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: KColors.lightgrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: KColors.primaryOrange,
                              width: 1.5,
                            ),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        keyboardType: TextInputType.phone,
                        onChanged: (phone) {
                          authController.phoneNumber.value = phone
                              .completeNumber
                              .replaceAll('+', '');
                        },
                        onCountryChanged: (country) {
                          log('Country changed to: ${country.name}');
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "EmailAddress*",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          floatingLabelStyle: WidgetStateTextStyle.resolveWith((
                            states,
                          ) {
                            if (states.contains(WidgetState.focused)) {
                              return TextStyle(color: KColors.primaryOrange);
                            }
                            return TextStyle(color: KColors.black);
                          }),
                          hintText: "abc@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: KColors.lightgrey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: KColors.lightgrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: KColors.primaryOrange,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
                SizedBox(height: 3.h),
                Obx(() {
                  if (authController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: KColors.primaryOrange,
                        color: KColors.white,
                      ),
                    );
                  }
                  return CustomButton(
                    text: "Login",
                    onPressed: () async {
                      if (toggleController.selectedIndex.value == 0) {
                        if (authController.phoneNumber.value.isEmpty) {
                          Get.snackbar(
                            'Error',
                            'Please enter phone number',
                            backgroundColor: KColors.primaryYellow,
                            colorText: KColors.black,
                          );
                          return;
                        }
                        await authController.checkPhoneUnique(
                          authController.phoneNumber.value,
                        );

                        if (authController.errorMessage.isNotEmpty) {
                          Get.snackbar(
                            'Error',
                            authController.errorMessage.value,
                          );
                          return;
                        }

                        if (authController.isPhoneUnique.value) {
                          Get.snackbar(
                            'Error',
                            'Phone number already registered. Please login.',
                          );
                        } else {
                          Get.snackbar(
                            backgroundColor: KColors.primaryYellow,
                            colorText: KColors.black,
                            'Login flow',
                            'Phone number already registered.',
                          );
                          Get.off(() => OtpVerificationPage());
                        }
                      } else {
                        Get.snackbar('Info', 'Email login not implemented yet');
                      }
                    },
                    hasGradient: true,
                  );
                }),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: KColors.lightgrey, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.w400,
                          color: KColors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: KColors.lightgrey, thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareButton(
                      icon: Icons.abc,
                      onPressed: () {},
                      image: Kimages.googleLogo,
                    ),
                    SizedBox(width: 3.w),
                    SquareButton(
                      icon: Icons.abc,
                      onPressed: () {},
                      image: Kimages.appleLogo,
                    ),
                  ],
                ),
                SizedBox(height: 13.h),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: KColors.black,
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w400,
                    ),
                    children: const [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Register Here",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
