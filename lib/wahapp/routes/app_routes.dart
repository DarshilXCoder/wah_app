import 'package:wah_app/wahapp/presentation/home/home_page.dart';
import 'package:wah_app/wahapp/presentation/pages/auth/login_page.dart';
import 'package:wah_app/wahapp/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashPage = '/splash_page';
  static const String loginPage = '/login_page';
  static const String homePage = '/home_page';
  static const String otpVerificationPage = '/home_page';
  static const String initialRoute = '/';

  static List<GetPage> pages = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: homePage, page: () => HomePage()),
  ];
}
