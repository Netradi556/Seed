import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/user_top_provider.dart';

import 'package:seed_app/provider/util_provider.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:seed_app/ui/top/user_profile/user_profile.dart';

const String imagePath1 = 'assets/images/userXX.jpg';
const String imagePath2 = 'assets/images/user2.jpg';
const String imagePath3 = 'assets/images/user3.jpg';
const String imagePath4 = 'assets/images/user4.jpg';
const String imagePath5 = 'assets/images/user5.jpg';
const String imagePath6 = 'assets/images/user6.jpg';
const String imagePath7 = 'assets/images/user7.jpg';
const String imagePath8 = 'assets/images/user0.jpg';

/*

  GridViewの更新処理ロジック
  ・FireStoreからのドキュメント取得は60件ずつ
  ・Widgetの作成は20件ずつ

  1.FireStoreから60件のドキュメントを取得
  2.1件目~20件目に対応するCardWidgetを生成
  3.スクロールダウンを検知
  4.21件目~40件目に対応するCardWidgetを生成
  5.スクロールダウンを検知
  6.41件目~60件目に対応するCardWidgetを生成
  7.FireStoreから60件のドキュメントを取得

  FireStoreから60件のドキュメントを取得する際の要件
  ・前回取得した60件とは別の60件にする
  　→FireStoreのDocumentにインデックスを貼れば解決できる？
  ・60件に満たない場合に、CardWidgetの生成を止める
  　→取得したSnapshotの要素数を、itemCountプロパティに設定するListの更新処理に含める
  ・取得したSnapshotはアプリ内で保持する
  ・スクロール位置を戻しても（要素数No.が若いところに戻っても）ドキュメントを取得しない

  CardWidgetの初回生成条件：
  初回のドキュメントリスト取得時に、要素数が20件（初回のリストの要素数）未満の可能性あり
  Listの定義をドキュメントリスト取得の後に変更する





*/

class UserTopSearchArea extends ConsumerWidget {
  UserTopSearchArea({
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: NewInfiniteGridView(),
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
class NewInfiniteGridView extends ConsumerWidget {
  NewInfiniteGridView({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(snapshotProvider);
    final isReloadState = ref.watch(isReloadProvider.state);
    final isLoadingState = ref.watch(isLoadingProvider.state);
    final isMaxState = ref.watch(isMaxProvider.state);

    scrollController.addListener(
      () {
        if (isLoadingState.state == false) {
          if (scrollController.offset ==
              scrollController.position.maxScrollExtent) {
            isLoadingState.state = true;
            Future<String> a = ref.read(snapshotProvider.notifier).fetchUsers();
            if (a.toString() == 'OK') {
              isReloadState.state = !isReloadState.state;
              print('取得');
              Future.delayed(
                const Duration(seconds: 2),
                (() {
                  print('３秒経過');
                  isLoadingState.state = false;
                }),
              );
              isMaxState.state = false;
            } else if (a.toString() == 'MAX') {
              isMaxState.state = true;
            }
          }
        }
      },
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(239, 229, 242, 240),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        itemCount: state.length,
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final documentSnapshot = state.elementAt(index);
          return isMaxState.state
              // isMaxStateがtrueになったらContainerを返す
              ? Container(
                  width: 170,
                  height: 300,
                  alignment: Alignment.center,
                  child: const Text('上限に達しました。\n 検索条件を変更してみてください。'),
                )
              // isMaxStateがfalseの間はユーザーカードを返す
              : NewUserCardWithSnapshot(documentSnapshot: documentSnapshot);
        },
      ),
    );
  }
}
//
//
//
//
//
//
//

class NewUserCardWithSnapshot extends StatelessWidget {
  NewUserCardWithSnapshot({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  final DocumentSnapshot documentSnapshot;
  final StorageRepo storageRepo = StorageRepo();

  // CardWidgetの枠線の色を指定
  final Color borderlineOutsideCard = const Color.fromARGB(235, 239, 218, 29);
  final Color borderlineShadow = const Color.fromARGB(144, 108, 108, 108);
  final Color userCardBackground = const Color.fromARGB(255, 245, 238, 220);

  @override
  Widget build(BuildContext context) {
    final handleName = documentSnapshot.get('handleName');
    final age = documentSnapshot.get('age');
    final about = documentSnapshot.get('about');

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NewUserProfilePage(documentSnapshot: documentSnapshot);
            },
          ),
        );
      },
      child: Container(
        width: 170,
        height: 300,
        decoration: BoxDecoration(
          color: userCardBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: const Color.fromARGB(197, 255, 229, 151),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(28, 23, 23, 23),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: storageRepo.getUserProfileImage(documentSnapshot.id),
              builder: ((context, snapshot) {
                return Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      // =========================================================================image
                      image: snapshot.data == null
                          ? const NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/our-first-seed.appspot.com/o/testData%2Fdemo.PNG?alt=media&token=7c4eb302-4009-4e04-9c16-84139d5209d5')
                          : NetworkImage(snapshot.data.toString()),

                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 2),
            // =================================================年齢 居住地
            SizedBox(
              width: 160,
              height: 22,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$handleName    $age歳        東京", // ======================ageパラメタ反映 $age
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            // ====================================================挨拶文
            SizedBox(
              width: 165,
              height: 41,
              child: Text(
                about.toString(),
                style: const TextStyle(
                  color: Color.fromARGB(206, 0, 0, 0),
                  fontSize: 13,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
