import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/size/k_size.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../global_component/drop_down/Kdrop_down_field.dart';
import '../../global_component/profile_card/profile_card.dart';
import '../my_order/my_order_page.dart';
import '../report_issue/add_report_page.dart';
import '../shipping_address/shipping_address_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: KSize.getWidth(context, 70),
                        height: KSize.getHeight(context, 90),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: KColor.black.withOpacity(0.4),
                            ),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage(AppAssets.product1))),
                      ),
                      const Positioned(
                        right: 10,
                        top: 80,
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: KColor.black,
                            child: Icon(Icons.edit)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudipto Sarker",
                          style: TextStyles.headline5.copyWith(
                            color: KColor.black38,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "sudiptosarker05@gmail.com",
                          style: TextStyles.bodyText1.copyWith(
                            color: KColor.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileCard(
                      title: 'My Order',
                      subTitle: 'Already have 12 Order',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderPage()));
                      },
                    ),
                    ProfileCard(
                      title: 'Shipping Address',
                      subTitle: 'Select Your Shipping Address',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ShippingAddressPage()));
                      },
                    ),
                    ProfileCard(
                      title: 'Report Issue',
                      subTitle: 'Report Order Details',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportIssue()));
                      },
                    ),
                    ProfileCard(
                      title: 'Setting',
                      subTitle: 'Update Your Profile',
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                KButton(
                  width: KSize.getWidth(context, 170),
                  height: 40,
                  isOutlineButton: false,
                  radius: 10,
                  color: KColor.black,
                  textStyle: TextStyles.subTitle.copyWith(
                    color: KColor.white,
                  ),
                  onPressedCallback: () {},
                  title: "Log Out",
                  trailingTitleIcon: Icon(
                    Icons.logout,
                    color: KColor.grey350,
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
