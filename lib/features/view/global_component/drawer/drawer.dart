import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';

class KDrawer extends ConsumerWidget {
  const KDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        color: KColor.background,
        width: context.screenWidth * 0.75,
        height: context.screenHeight * 1,
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'E-commerce',
                      style:
                          TextStyles.headline1.copyWith(color: KColor.primary),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Divider(color: KColor.black.withOpacity(0.2), thickness: 1),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/mainScreen');
                    },
                    child: Text(
                      'Home',
                      style: TextStyles.subTitle.copyWith(color: KColor.black),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ListView.builder(
                  //   itemCount: 5,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.zero,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             // if (menuData.user.isActive == 1) {
                  //             //   // ref
                  //             //   //     .read(shopProvider.notifier)
                  //             //   //     .fetchShopProductList(
                  //             //   //         categoryId: menuData.menus[index].id);

                  //             //   Navigator.pushNamed(context, '/shop');
                  //             // } else {
                  //             //   toast('Coming soon...');
                  //             // }
                  //           },
                  //           child: Text(
                  //            "Sudipto Sarker",
                  //             style: TextStyles.subTitle
                  //                 .copyWith(color: KColor.black),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 16),
                  //       ],
                  //     );
                  //   },
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/contact');
                    },
                    child: Text(
                      'Contact Us',
                      style: TextStyles.subTitle.copyWith(color: KColor.black),
                    ),
                  ),

                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      'About Us',
                      style: TextStyles.subTitle.copyWith(color: KColor.black),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      'Shop ',
                      style: TextStyles.subTitle.copyWith(color: KColor.black),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.05),
                  Divider(color: KColor.black.withOpacity(0.2), thickness: 1),
                  // if (!getBoolAsync(isLoggedIn))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Log In',
                          style:
                              TextStyles.subTitle.copyWith(color: KColor.black),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Registration',
                          style:
                              TextStyles.subTitle.copyWith(color: KColor.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Divider(color: KColor.black.withOpacity(0.2), thickness: 1),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri(scheme: 'tel', path: '+8801998685230'));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SvgPicture.asset('assets/images/phoneIcon.svg'),
                          const SizedBox(width: 10),
                          Text(
                            '01998-685230',
                            style: TextStyles.subTitle
                                .copyWith(color: KColor.black.withOpacity(0.8)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        launchUrl(
                            Uri(scheme: 'mailto', path: 'ecommerce@gmail.com'));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SvgPicture.asset('assets/images/emailIcon.svg'),
                          const SizedBox(width: 10),
                          Text(
                            'e-commerce@gmail.com',
                            style: TextStyles.subTitle.copyWith(
                              fontSize: 14,
                              color: KColor.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.facebook.com/finesselifestyleofficial');
                          },
                          icon: SvgPicture.asset('assets/svg/facebookIcon.svg',
                              color: KColor.facebookLogoColor),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.instagram.com/finesse_lifestyle_bd/');
                          },
                          icon: SvgPicture.asset('assets/svg/instaIcon.svg',
                              color: KColor.instagramLogoColor),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.youtube.com/channel/UCSUcQ8_MuhFzNh4E5BlTR-g');
                          },
                          icon: SvgPicture.asset('assets/svg/youtubeIcon.svg',
                              color: KColor.primary),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
