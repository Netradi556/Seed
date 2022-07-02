import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/provider/util_provider.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:seed_app/ui/user_top/user_profile.dart';

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
  const UserTopSearchArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: InfiniteGridView(),
        ),
      ),
    );
  }
}

class InfiniteGridView extends ConsumerWidget {
  InfiniteGridView({Key? key}) : super(key: key);

  // スクロール検知用のScrollController
  final ScrollController _scrollController = ScrollController();

  // FireStore, CloudStorageの操作用Repository
  final FireStoreRepo fireStoreRepo = FireStoreRepo();
  final StorageRepo storageRepo = StorageRepo();

  // 一回の読み込みでクエリするドキュメントの数＝生成したいCardWidgetの数
  final int loadCard = 5;
  // 最初に読み込みするCardWidgetの数
  final int firstLoad = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(gridViewStateProvider.state);
    Future<QuerySnapshot> querySnapshot =
        fireStoreRepo.getQuerySnapshotAtUserTop(5);
    // 表示するデータのList、初期値として20件
    List<int> items = List.generate(firstLoad, (index) => index);

    // ScrollControllerにイベントリスナーを設定：イベント検知
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent.toInt() - 10 <
            _scrollController.position.pixels.toInt()) {
          items
              .addAll(List.generate(loadCard, (index) => items.length + index));

          fireStoreRepo.addQueryDocumentSnapshotAtUserTop(
              querySnapshot, loadCard);

          param.state = !param.state;
        }
      },
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(239, 229, 242, 240),
      body: FutureBuilder(
        future: querySnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final List<QueryDocumentSnapshot<Object?>>? queryDocumentSnapshot =
              snapshot.data?.docs;

          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            itemCount: items.length,
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              int? a = queryDocumentSnapshot?.length;
              print(a);
              if (a == null) {
                return const Text('検索結果は0件です。');
              } else {
                if (index <= a) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                      queryDocumentSnapshot?[index];
                  print(documentSnapshot?.get('handleName').toString());
                  print(documentSnapshot!.id);

                  return UserCardWithSnapshot(
                    imagePath: documentSnapshot.id,
                    handleName: documentSnapshot.get('handleName').toString(),
                    about: documentSnapshot.get('about').toString(),
                    age: documentSnapshot.get('age').toString(),
                  );
                } else {
                  final double angle = doubleInRange(Random(), -0.04, 0.04);
                  return Transform.rotate(
                    angle: angle,
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Container(
                        width: 170,
                        height: 300,
                        color: Colors.black87,
                      ),
                    ),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  // 表示するユーザーのプロフィール写真用PATH
  final String imagePath;

  // CardWidgetの枠線の色を指定
  final Color borderlineOutsideCard = const Color.fromARGB(0, 255, 255, 255);
  final Color borderlineShadow = const Color.fromARGB(144, 108, 108, 108);
  final Color userCardBackground = const Color.fromARGB(255, 198, 162, 162);

  @override
  Widget build(BuildContext context) {
    final double angle = doubleInRange(Random(), -0.04, 0.04);

    return Transform.rotate(
      alignment: Alignment.center,
      angle: angle,

      // 大枠
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const UserProfilePage();
              },
            ),
          );
        },
        child: SizedBox(
          width: 170,
          height: 300,
          // elevationプロパティで影をつける
          // shapeプロパティで枠の形、太さ、色を決定
          child: Material(
            color: userCardBackground,
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: borderlineOutsideCard,
              ),
            ),
            // 中枠の余白
            child: Padding(
              padding: const EdgeInsets.fromLTRB(3, 8, 3, 2),
              // 中枠内の配置
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 影の作成のためにMaterialWidgetを利用
                  Material(
                    elevation: 0.8,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                      width: 165,
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // ====================================================年齢 居住地
                  const SizedBox(
                    width: 160,
                    height: 22,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "25歳  東京",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // ============================================================挨拶文
                  const SizedBox(
                    width: 165,
                    height: 41,
                    child: Text(
                      "このご時世ですが前向きに進めたいのでまた再開😄",
                      style: TextStyle(
                        color: Color(0x75000000),
                        fontSize: 13,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
}

// =============================================================================QueryDocumentSnapshotを受け取るように変更
class UserCardWithSnapshot extends StatelessWidget {
  UserCardWithSnapshot({
    Key? key,
    required this.imagePath,
    required this.handleName,
    required this.age,
    required this.about,
  }) : super(key: key);

  // ===========================================================================QueryDocumentSnapshotのデータで初期化
  final String imagePath;
  final String? handleName;
  final String? age;
  final String? about;

  // CardWidgetの枠線の色を指定
  final Color borderlineOutsideCard = Color.fromARGB(235, 239, 218, 29);
  final Color borderlineShadow = const Color.fromARGB(144, 108, 108, 108);
  final Color userCardBackground = Color.fromARGB(255, 245, 238, 220);

  final StorageRepo storageRepo = StorageRepo();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const UserProfilePage();
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
            color: Color.fromARGB(197, 255, 229, 151),
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
              future: storageRepo.getUserProfileImage(imagePath),
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
                          ? NetworkImage(
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

// スナップショットデザイン（ランダム角度）のWidget
class OLDUserCardWithSnapshot extends StatelessWidget {
  OLDUserCardWithSnapshot({
    Key? key,
    required this.imagePath,
    required this.handleName,
    required this.age,
    required this.about,
  }) : super(key: key);

  // ===========================================================================QueryDocumentSnapshotのデータで初期化
  final String imagePath;
  final String? handleName;
  final String? age;
  final String? about;

  // CardWidgetの枠線の色を指定
  final Color borderlineOutsideCard = const Color.fromARGB(0, 255, 255, 255);
  final Color borderlineShadow = const Color.fromARGB(144, 108, 108, 108);
  final Color userCardBackground = const Color.fromARGB(255, 235, 235, 235);

  final StorageRepo storageRepo = StorageRepo();

  @override
  Widget build(BuildContext context) {
    final double angle = doubleInRange(Random(), -0.04, 0.04);

    return Transform.rotate(
      alignment: Alignment.center,
      angle: angle,

      // 大枠
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const UserProfilePage();
              },
            ),
          );
        },
        child: SizedBox(
          width: 170,
          height: 300,
          // elevationプロパティで影をつける
          // shapeプロパティで枠の形、太さ、色を決定
          child: Material(
            color: userCardBackground,
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: borderlineOutsideCard,
              ),
            ),
            // 中枠の余白
            child: Padding(
              padding: const EdgeInsets.fromLTRB(3, 8, 3, 2),
              // 中枠内の配置
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 影の作成のためにMaterialWidgetを利用
                  Material(
                    elevation: 1,
                    child: FutureBuilder(
                      future: storageRepo.getUserProfileImage(imagePath),
                      builder: ((context, snapshot) {
                        return Container(
                          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                          width: 165,
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              // =========================================================================image
                              image: snapshot.data == null
                                  ? NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/our-first-seed.appspot.com/o/testData%2Fdemo.PNG?alt=media&token=7c4eb302-4009-4e04-9c16-84139d5209d5')
                                  : NetworkImage(snapshot.data.toString()),

                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        );
                      }),
                    ),
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
          ),
        ),
      ),
    );
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
}
