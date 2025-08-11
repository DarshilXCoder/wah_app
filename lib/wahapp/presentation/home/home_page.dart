import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wah_app/core/constants/images.dart';
import 'package:wah_app/wahapp/presentation/pages/auth/login_page.dart';
import 'package:wah_app/core/constants/colors.dart';
import 'package:wah_app/wahapp/presentation/widgets/const_logo.dart';
import 'package:wah_app/wahapp/presentation/widgets/const_text.dart';
import 'package:wah_app/wahapp/presentation/widgets/custombuttom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(Kimages.homebg, height: 50.h, width: double.infinity),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 53.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: KColors.white,
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: const Offset(0, -6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppLogo(),
                          AppText(
                            centerSubText: "Seamlessly",
                            headingText: "Welcome to Wah!",
                            subHeadingText: "Connecting Customers and Vendors",
                          ),
                          CustomButton(
                            onPressed: () {
                              Get.to(() => LoginPage());
                            },
                            text: "I'm a Customer",
                            color: KColors.primaryYellow,
                          ),
                          CustomButton(
                            onPressed: () {},
                            text: "I'm a Vendor",
                            color: KColors.primaryOrange,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: KColors.lightgrey,
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w400,
                              ),
                              children: const [
                                TextSpan(
                                  text: "By clicking, i accept all the ",
                                ),
                                TextSpan(
                                  text: "T&C ",
                                  style: TextStyle(
                                    color: KColors.primaryOrange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: "and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: KColors.primaryOrange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
