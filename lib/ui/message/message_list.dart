import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/ui/message/chat_screen.dart';

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

class MessageScreenWidget extends StatelessWidget {
  MessageScreenWidget({
    Key? key,
  }) : super(key: key);

  final FireStoreRepo fireStoreRepo = FireStoreRepo();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStoreRepo.firestore.collection('user').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            snapshot.data!.docs.map((DocumentSnapshot document) {}).toList();

            return Card(
              child: ListTile(
                onTap: () {
                  // チャットの内容（名前・メッセージ）はStreamで取得
                  fireStoreRepo.getUserByUsername('');

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ChatScreen();
                      },
                    ),
                  );
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                leading: ClipOval(child: Image.asset('assets/images/demo.png')),
                trailing: const Text('3分前'),
                title: const Text('Mentaくん'),
                subtitle: const Text('Flutter面白い'),
              ),
            );
          },
        );
      },
    );
  }
}
