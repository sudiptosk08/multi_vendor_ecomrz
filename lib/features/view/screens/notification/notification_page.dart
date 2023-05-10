import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../global_component/appBar/app_bar.dart';
import 'component/notification_card.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: KAppBar(
          checkTitle: true,
          title: 'Notification',
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            // SearchTextField(
            //   callbackFunction: (e) {
            //     ref.read(notificationProvider.notifier).fetchNotification();
            //   },
            //   controller: search,
            //   readOnly: false,
            //   hintText: 'Search',
            // ),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: NotificationCard(
                              msg: "Your order is delivered for processing.",
                              seen: "seen",
                              date: "01-04-23",
                              // seen:
                              cancel: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },

                              delete: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      ),
                    ]),
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  String createDate(String? date, int? index) {
    List dates = date!.split(" ");
    return dates[index!];
  }
}
