import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/user_top_provider.dart';

import 'package:seed_app/repository/storage_repo.dart';
import 'package:seed_app/ui/top/user_profile/user_profile.dart';
import 'package:shimmer/shimmer.dart';

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
    return InfiniteGridView();
  }
}

//
//
//
//
//
//
//
class InfiniteGridView extends ConsumerWidget {
  InfiniteGridView({Key? key}) : super(key: key);

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

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        shrinkWrap: false,
        itemCount: state.length,
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
          mainAxisExtent: 250,
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
              : UserCardWithSnapshot(documentSnapshot: documentSnapshot);
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

class UserCardWithSnapshot extends StatelessWidget {
  UserCardWithSnapshot({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  final DocumentSnapshot documentSnapshot;
  final StorageRepo storageRepo = StorageRepo();

  // CardWidgetの枠線の色を指定
  final double width = 180;
  final double height = 250;
  final Color borderlineOutsideCard = const Color.fromARGB(235, 239, 218, 29);
  final Color borderlineShadow = const Color.fromARGB(144, 108, 108, 108);
  final Color userCardBackground = const Color.fromARGB(255, 245, 238, 220);
  final double radius = 20;

  @override
  Widget build(BuildContext context) {
    // final handleName = documentSnapshot.get('handleName');
    final age = documentSnapshot.get('age');
    final about = documentSnapshot.get('about');
    // final livingPlace = documentSnapshot.get('livingPlace');

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
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: userCardBackground,
          borderRadius: BorderRadius.circular(radius),
          // ============================================================枠線
/*           border: Border.all(
            width: 3,
            color: const Color.fromARGB(197, 255, 229, 151),
          ), */
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(28, 23, 23, 23),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: FutureBuilder(
          future: storageRepo.getUserProfileImage(documentSnapshot.id),
          builder: (context, snapshot) {
            Widget child;

            if (snapshot.hasData) {
              child = Stack(
                fit: StackFit.expand,
                children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Image.network(
                        snapshot.data.toString(),
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: Shimmer.fromColors(
                              baseColor: const Color.fromARGB(255, 244, 149, 54)
                                  .withOpacity(0.3),
                              highlightColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              child: Container(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    width: 180,
                    height: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 2),
                          // =================================================年齢 居住地
                          SizedBox(
                            width: 160,
                            height: 22,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                // TODO: Crit:  livingPlaceを追加
                                "$age歳    東京", // ======================
                                style: const TextStyle(
                                  color: Color.fromARGB(177, 255, 255, 255),
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
                                color: Color.fromARGB(232, 255, 255, 255),
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              // TODO: High: 画像ローディング失敗時の表示内容
              child = Text('失敗');
            } else {
              child = Container();
            }

            return child;
          },
        ),
      ),
    );
  }
}
