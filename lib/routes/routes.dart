// Route list and route string will be here

import 'package:ecommerce_app/app/view/screens/auth/login_page.dart';
import 'package:get/get.dart';

class Routes {
  static const loginPage = '/loginPage';

  static var list = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    ),
  ];
}
