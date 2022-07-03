import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'message_screen.dart';

/*
 Listviewのロジック
  List A：マッチングしているユーザー情報オブジェクトが格納されたリスト
  Listview：自作Widget AにList Aの情報と、インデックスを渡してリスト表示させる
  自作Widget A：List Aの情報と、Listviewのインデックスを受け取って、１項目を作成する

*/

class MessagePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Color appBarIconColor = const Color.fromARGB(255, 0, 0, 0);
  final Color backgroundColor = const Color(0xFFF5F5F5);

  MessagePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text('メッセージ', style: TextStyle(color: Colors.black87)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shield),
            color: appBarIconColor,
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: MessageScreenWidget(),
      ),
    );
  }
}
