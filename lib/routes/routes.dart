// Route list and route string will be here

import 'package:ecommerce_app/app/view/screens/auth/login_page.dart';
import 'package:ecommerce_app/app/view/screens/home/home_page.dart';
import 'package:ecommerce_app/app/view/screens/wishlist/wishList_page.dart';
import 'package:ecommerce_app/main_screen.dart';
import 'package:get/get.dart';

import '../app/view/screens/cart/cart_page.dart';
import '../app/view/screens/profile/profile_page.dart';

class Routes {
  static const loginPage = '/loginPage';
  static const homePage = '/homePage';
  static const cartPage = '/cartPage';
  static const homeScreen = '/homeScreen';
  static const profilePage = '/profilePage';
  static const wishListPage = '/wishListPage';
  


  static var list = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name:homePage,
      page: () =>const HomePage(),
    ),
     GetPage(
      name: cartPage,
      page: () =>  CartPage(),
    ),
     GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
     GetPage(
      name: wishListPage,
      page: () => WishListPage(),
    ),
    GetPage(
      name: profilePage,
      page: () => ProfilePage(),
    ),
  ];
}
