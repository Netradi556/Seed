import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/ui/user_menu_to_pages/notification_detail.dart';

class NotificationPageWidget extends ConsumerWidget {
  NotificationPageWidget({Key? key}) : super(key: key);

  var listItem = ['User 1', 'User 2', 'User 3'];
  String imagePath = 'assets/images/user1.jpg';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0.34, -1),
                    end: AlignmentDirectional(-0.34, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                    Text('運営からのお知らせ'),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                color: Color(0xFFF1F8F7),
                child: Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xFF434F4F)),
                            ),
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.notifications),
                            ),
                            title: Text('お知らせ $index'),
                            subtitle: Text('お知らせの1行目を表示'),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return NotificationDetailPageWidget();
                                },
                              ),
                            ),
                          ));
                    },
                    itemCount: listItem.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
