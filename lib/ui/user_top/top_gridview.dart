import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/util_provider.dart';
import 'package:seed_app/ui/user_top/user_profile_page.dart';

const String imagePath1 = 'assets/images/user1.jpg';
const String imagePath2 = 'assets/images/user2.jpg';
const String imagePath3 = 'assets/images/user3.jpg';
const String imagePath4 = 'assets/images/user4.jpg';
const String imagePath5 = 'assets/images/user5.jpg';
const String imagePath6 = 'assets/images/user6.jpg';
const String imagePath7 = 'assets/images/user7.jpg';
const String imagePath8 = 'assets/images/user0.jpg';

class InfiniteGridView extends ConsumerWidget {
  InfiniteGridView({Key? key}) : super(key: key);

  // 表示するデータのList、初期値として20件
  final List<int> items = List.generate(20, (index) => index);

  // スクロール検知用のScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(gridViewStateProvider.state);

    // ScrollControllerにイベントリスナーを設定：イベント検知
    _scrollController.addListener(
      () {
        // =====================================================================取得できたSnapShotのLength分だけ伸ばすようにする

        // 最後までスクロールしたら
        if (_scrollController.position.maxScrollExtent.toInt() - 300 <
            _scrollController.position.pixels.toInt()) {
          // データを増やす際にFireStoreから取得しないといけない
          // 一度に取得する情報を多くするのが最適？？

          // 要素を20ずつ増やしていく
          items.addAll(List.generate(20, (index) => items.length + index));
          param.state = !param.state;
        }
      },
    );

    return Scaffold(
      body: FutureBuilder(
        future: getQuerySnapshot(),
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
              if (index > 8) {
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
              } else if (index <= 8) {
                if (index < 5) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                      queryDocumentSnapshot?[index];
                  print(documentSnapshot?.get('handleName').toString());
                  // ==============================================================handleName以外のパラメータも渡す
                  return UserCardWithSnapshot(
                    imagePath: 'assets/images/user$index.jpg',
                    handleName: documentSnapshot?.get('handleName').toString(),
                  );
                }
                return UserCard(
                  imagePath: 'assets/images/user$index.jpg',
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  Future<QuerySnapshot> getQuerySnapshot() async {
    // ================================================================異性のみのドキュメントを取得するように変更
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('sex', isEqualTo: '女性')
        .get();

/*     FirebaseFirestore.instance
        .collection('user')
        .where('sex', isEqualTo: '女性')
        .get()
        .then(
            (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
                  print(doc["handleName"]);
                })); */

    return snapshot;
  }
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
                  // 年齢 居住地
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
                  // 挨拶文
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

class UserCardWithSnapshot extends StatelessWidget {
  const UserCardWithSnapshot(
      {Key? key, required this.imagePath, required this.handleName})
      : super(key: key);

  // 表示するユーザーのプロフィール写真用PATH
  final String imagePath;
  final String? handleName;

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
                  // 年齢 居住地
                  SizedBox(
                    width: 160,
                    height: 22,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$handleName 25歳  東京",
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
                  // 挨拶文
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
