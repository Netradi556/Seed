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
  var listItem = ['User 1', 'User 2', 'User 3'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text(
          'メッセージ',
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shield,
            ),
            color: Colors.black87,
          )
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: MessageScreenWidget(),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  final List<String> listItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 12,
          child: Container(
            child: const Text('広告orコンテンツ表示欄'),
            width: double.infinity,
            color: const Color.fromARGB(255, 185, 217, 178),
          ),
        ),
        Expanded(
          flex: 100,
          child: Container(
            color: const Color(0xFFE9EFF4),
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
                      subtitle: const Text('lastMessageText'),
                      onTap: () {/* react to the tile being tapped */},
                    ));
              },
              itemCount: listItem.length,
            ),
          ),
        ),
      ],
    );
  }
}
