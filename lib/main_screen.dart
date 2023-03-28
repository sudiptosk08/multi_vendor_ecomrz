import 'package:ecommerce_app/app/view/screens/cart/cart_page.dart';
import 'package:ecommerce_app/app/view/screens/profile/profile_page.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'app/view/screens/home/home_page.dart';
import 'app/view/screens/wishlist/wishList_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var token;
  var user;
  void initState() {
    // getCredentials();
    // getDarkCredentials();

    print('Token');
    super.initState();
  }

  // getCredentials() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   token = localStorage.getString('token');
  //   user = localStorage.getString('userData');
  //   setState(() {
  //     store.state.userDataState =
  //         json.decode(localStorage.getString('userData')!);
  //   });
  // }

  // getDarkCredentials() async {
  //   SharedPreferences darkMod = await SharedPreferences.getInstance();
  //   darkMod.getString('mode');
  //   setState(() {
  //     store.state.darkModeState =
  //         json.decode(darkMod.getString('mode').toString());
  //   });
  //   print("--------store.stetta.darkmode-------");
  //   print(store.state.darkModeState);
  // }

  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const WishListPage(),
    CartPage(),
    const ProfilePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = (store.state.logoutUserData == "WishList")
  //     ? WishListPage()
  //     : (store.state.logoutUserData == "CartPage")
  //         ? CartScreen()
  //         : (store.state.logoutUserData == "ProfileScreen")
  //             ? ProfileScreen()
  //             : HomePage();
  Widget currentScreen = const HomePage();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
      ),
      // floatingActionButton: FloatingActionBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {
                    setState(() {
                      currentScreen = const HomePage();
                      currentTab = 0;
                      // store.state.logoutUserData = null;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home_rounded,
                          size: 33,
                          color: currentTab == 0
                              ? AppColors.primary
                              : AppColors.black),
                      Text(
                        "Home",
                        style: TextStyles.bodyText3.copyWith(
                          fontWeight: FontWeight.w600,
                          color: currentTab == 0
                              ? AppColors.black
                              : AppColors.textgrey,
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
                      Icon(Icons.favorite,
                          size: 33,
                          color: currentTab == 1
                              ? AppColors.primary
                              : AppColors.black),
                      Text(
                        "Wishlist",
                        style: TextStyles.bodyText3.copyWith(
                          fontWeight: FontWeight.w600,
                          color: currentTab == 1
                              ? AppColors.black
                              : AppColors.textgrey,
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
                          color: currentTab == 2
                              ? AppColors.primary
                              : AppColors.black),
                      Text(
                        "Cart",
                        style: TextStyles.bodyText3.copyWith(
                          fontWeight: FontWeight.w600,
                          color: currentTab == 2
                              ? AppColors.black
                              : AppColors.textgrey,
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
                          color: currentTab == 3
                              ? AppColors.primary
                              : AppColors.black),
                      Text(
                        "Account",
                        style: TextStyles.bodyText3.copyWith(
                          fontWeight: FontWeight.w600,
                          color: currentTab == 3
                              ? AppColors.black
                              : AppColors.textgrey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
