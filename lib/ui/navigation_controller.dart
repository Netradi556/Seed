// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/provider/util_provider.dart';

// PageWidgets
import 'top/top.dart';
import 'like/like.dart';
import 'message/message_list.dart';
import 'mypage/mypage.dart';

class NavigationPageController extends ConsumerWidget {
  final List<Widget> navigationPageList = [
    UserTopWidget(),
    LikePageWidget(),
    MessagePageWidget(),
    MypagePageWidget(),
  ];

  NavigationPageController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(navigationIndexProvider);

    return Scaffold(
      body: navigationPageList[navigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color.fromARGB(255, 238, 228, 112),
        selectedItemColor: Color.fromARGB(255, 136, 103, 38),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '探す'),
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism), label: 'いいね！'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
        ],
        currentIndex: navigationIndex,
        onTap: (index) {
          ref.read(navigationIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
