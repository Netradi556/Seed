import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/user_top/user_top_search.dart';
import 'package:seed_app/ui/user_top/user_top_header.dart';
import 'package:seed_app/ui/user_top/user_top_middle.dart';

/*
  マッチング相手を探す画面
  BottomNavigationBarの「さがす」で表示

*/

/*
  ToDo（High）
  ユーザー画像の引き伸ばしをしないように
  アップロード時に画像の範囲選択をするには？
  _TopHeaderContainerWidgetのAlignを_TopMiddleContainerWidgetに移す
  登録中のユーザーの動的表示

*/

class UserTopWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserTopWidget({Key? key}) : super(key: key);

  // white SafeAreaあたりの色が変わるだけ
  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            UserTopHeaderArea(),
            UserTopMiddleArea(),
            UserTopSearchArea(),
          ],
        ),
      ),
    );
  }
}
