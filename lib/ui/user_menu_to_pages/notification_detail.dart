import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  通知の詳細を確認する画面
  ログイン中のユーザーに配信された通知を表示する
  ユーザー情報と紐付いた通知データをFireStoreに格納しておく
  前画面（NotificationPage）でタップされた通知の詳細データをFireStoreから
  引っ張ってくるorクライアント内に保存しておき、それを参照する

*/

/*
  FireStore内のコレクション・ドキュメントを検索？
  前のページから遷移するときに渡してもらえば良いのでは？

  前画面（NotificationPage）から遷移する際に、コレクション・ドキュメントのデータを
  貰い受けて、それを画面に表示する

*/

/*
  Todo



*/

class NotificationDetailPageWidget extends ConsumerWidget {
  const NotificationDetailPageWidget({Key? key}) : super(key: key);

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
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
