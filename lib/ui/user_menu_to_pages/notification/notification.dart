import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/ui/user_menu_to_pages/notification/notification_detail.dart';

/*
  運営からの通知の一覧を表示する画面
  ログイン中のユーザーに配信された通知の一覧（分類、タイトル、配信時間）を表示
  データはログイン中のユーザーIDをもとに、FireStoreから取得する
  タグの種類に応じて、タグのスタイル（背景色、フォント色）を変更する

  一覧の中のアイテムをタップしたら詳細画面へ遷移する
*/

/*
  Todo
  ロゴを無くす
  タグの表示領域を作成する
  本文の表示領域を2行にする
  配信時間の表示領域を作成する
  FireStoreに配信データを作成する
  FireStoreからデータを取得する処理を実装する
  一覧をタップしたら詳細画面へ遷移する処理を実装する
  詳細画面へ遷移する際に、通知に関するデータ（ID？）を渡す処理を実装する
*/

class NotificationPageWidget extends ConsumerWidget {
  NotificationPageWidget({Key? key}) : super(key: key);

  var listItem = ['User 1', 'User 2', 'User 3'];
  String imagePath = 'assets/images/user1.jpg';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const Text('運営からのお知らせ'),
                    const Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                color: const Color(0xFFF1F8F7),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF434F4F)),
                          ),
                        ),
                        child: ListTile(
                          leading: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(Icons.notifications),
                          ),
                          title: Text('お知らせ $index'),
                          subtitle: const Text('お知らせの1行目を表示'),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const NotificationDetailPageWidget();
                              },
                            ),
                          ),
                        ));
                  },
                  itemCount: listItem.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
