// Route list and route string will be here

import 'package:ecommerce_app/app/view/screens/auth/login_page.dart';
import 'package:ecommerce_app/app/view/screens/home/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const loginPage = '/loginPage';
  static const homePage = '/homePage';

  static var list = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name:homePage,
      page: () =>const HomePage(),
    ),
  ];
}
