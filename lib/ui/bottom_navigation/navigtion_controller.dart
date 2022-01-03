// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/view_model/util_auth.dart';

// PageWidgets
import 'usr_top.dart';
import 'like.dart';
import 'event.dart';
import 'message.dart';
import 'mypage.dart';

class NavigationController extends ConsumerWidget {
  List<ConsumerWidget> navigationPageList = [
    UserTopWidget(),
    LikePageWidget(),
    EvetnPageWidget(),
    MessagePageWidget(),
    MypagePageWidget(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(navigationIndexProvider.notifier);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amberAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '探す'),
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism), label: 'いいね！'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_month), label: 'イベント'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
        ],
        currentIndex: navigationIndex.state,
        onTap: (index) {
          navigationIndex.state = index;
        },
      ),
    );
  }
}
