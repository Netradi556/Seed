// スナップショットデザイン（ランダム角度）のWidget
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:seed_app/ui/user_top/user_profile.dart';

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

class OLDUserCard extends StatelessWidget {
  const OLDUserCard({
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
