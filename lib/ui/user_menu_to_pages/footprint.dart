import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/ui/user_menu_to_pages/user_menu_importer.dart';

/*
  直近一週間の自分のプロフィールを閲覧したユーザーの一覧を日別に表示する画面
  表示する訪問側のユーザーの情報はサムネ、ハンドルネーム、概要、年齢、エリア、訪問時間
  表示する訪問側のユーザーの情報は、訪問者のユーザーIDを元にFireStoreの参照型を利用する

*/

/*
  Todo
  ユーザー


*/

class FootprintPagesWidget extends ConsumerWidget {
  FootprintPagesWidget({Key? key}) : super(key: key);
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
                    const Text('プロフィールを閲覧したユーザー'),
                    const Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                child: const Text('広告orコンテンツ表示欄'),
                width: double.infinity,
                color: const Color(0xFF3EC922),
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                color: const Color(0xFFF1F8F7),
                child: Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xFF434F4F)),
                            ),
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.fill),
                                border: Border.all(
                                  width: 1,
                                ),
                              ),
                            ),
                            title: Text('ユーザー名 $index'),
                            subtitle: const Text('プロフィールの1行目を表示'),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyProfilePageWidget();
                                },
                              ),
                            ),
                          ));
                    },
                    itemCount: listItem.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
