import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'features/view/global_component/drawer/drawer.dart';
import 'features/view/screens/cart/cart_page.dart';
import 'features/view/screens/home/home_page.dart';
import 'features/view/screens/profile/profile_page.dart';
import 'features/view/screens/wishlist/wishList_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var token;
  var user;
  @override
  void initState() {
    super.initState();
  }

  int currentTab = 0;
  final List<Widget> screens = [
     HomePage(),
    const WishListPage(),
    CartPage(),
    const ProfilePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen =  HomePage();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.background,
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        // floatingActionButton: FloatingActionBottom(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          color: KColor.background,
          child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen =  HomePage();
                        currentTab = 0;
                        // store.state.logoutUserData = null;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_rounded,
                            size: 33,
                            color:
                                currentTab == 0 ? KColor.primary : KColor.gray),
                        Text(
                          "Home",
                          style: TextStyles.bodyText3.copyWith(
                            color: currentTab == 0
                                ? KColor.primary
                                : KColor.textgrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const WishListPage();
                        // : Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => token != null
                        //             ? CartScreen()
                        //             : LogInScreen()));
                        currentTab = 1;
                        // store.dispatch(LogoutUserAction("WishList"));
                        // store.state.logoutUserData = null;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_rounded,
                            size: 33,
                            color:
                                currentTab == 1 ? KColor.primary : KColor.gray),
                        Text(
                          "Wishlist",
                          style: TextStyles.bodyText3.copyWith(
                            color: currentTab == 1
                                ? KColor.primary
                                : KColor.textgrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        // Navigator.push(
                        //     context,
                        // MaterialPageRoute(
                        //     builder: (context) => token != null
                        //         ? CartScreen()
                        //         : LogInScreen()));
                        currentScreen = CartPage();
                        currentTab = 2;
                        // store.dispatch(LogoutUserAction("CartPage"));
                        // store.state.logoutUserData = null;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag,
                            size: 33,
                            color:
                                currentTab == 2 ? KColor.primary : KColor.gray),
                        Text(
                          "Cart",
                          style: TextStyles.bodyText3.copyWith(
                            color: currentTab == 2
                                ? KColor.primary
                                : KColor.textgrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        // token != null
                        currentScreen = const ProfilePage();
                        // : Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //              CartPage()
                        //             ));
                        currentTab = 3;
                        // store.dispatch(LogoutUserAction("ProfileScreen"));
                        // store.state.logoutUserData = null;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2,
                            size: 33,
                            color:
                                currentTab == 3 ? KColor.primary : KColor.gray),
                        Text(
                          "Account",
                          style: TextStyles.bodyText3.copyWith(
                            color: currentTab == 3
                                ? KColor.primary
                                : KColor.textgrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
