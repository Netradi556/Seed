import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/ui/bottom_navigation/mypage.dart';

class YourlikePageWidget extends ConsumerWidget {
  const YourlikePageWidget({Key? key}) : super(key: key);

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
                    Text('自分からのいいね'),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                child: Text('広告orコンテンツ表示欄'),
                width: double.infinity,
                color: Color(0xFF3EC922),
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                color: Color(0xFFF1F8F7),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
