import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 Listviewのロジック
  List A：マッチングしているユーザー情報オブジェクトが格納されたリスト
  Listview：自作Widget AにList Aの情報と、インデックスを渡してリスト表示させる
  自作Widget A：List Aの情報と、Listviewのインデックスを受け取って、１項目を作成する

*/

class MessagePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var listItem = ['User 1', 'User 2', 'User 3'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
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
                  children: const [
                    Text('メッセージ'),
                    Icon(Icons.shield),
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
                color: Color(0xFFE9EFF4),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF434F4F)),
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text('userNo. $index'),
                          subtitle: Text('lastMessageText'),
                          onTap: () {/* react to the tile being tapped */},
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
