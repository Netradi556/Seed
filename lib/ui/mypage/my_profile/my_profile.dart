import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/ui/mypage/my_profile/edit_my_profile/edit_my_profile.dart';
import 'package:seed_app/ui/mypage/my_profile/mp_introduction.dart';
import 'package:seed_app/ui/mypage/my_profile/mp_introduction_card.dart';
import 'package:seed_app/ui/mypage/my_profile/mp_score.dart';

import 'package:seed_app/ui/mypage/my_profile/mp_items_list.dart';
import 'package:seed_app/controller/user_controller.dart';

/*
  ユーザーのプロフィールを表示する画面
  登録済みのプロフィールを表示する他、ログインステータスの表示も反映する



*/

class MyProfilePageWidget extends ConsumerWidget {
  MyProfilePageWidget({Key? key}) : super(key: key);
  // TODO: Crit: EdtiProfileした内容が前のページまで戻らないと反映されない、Snapshotが更新されない

  // デザイン関係
  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  // 処理関係
  final FireStoreRepo fireStoreRepo = FireStoreRepo();
  final UserModel? _currentUser = locator.get<UserController>().currentUser;
  final ProfileItemJAP profileItem = ProfileItemJAP();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        // AppBarのデザイン修正
        // SilverAppBarに変更、丸みを帯びたデザインに変更
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          elevation: .6,
          title: Text('マイプロフィール', style: TextStyle(color: appBarTextColor)),
          backgroundColor: appBarBackgroundColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                stops: [0, 1],
                begin: AlignmentDirectional(0.34, -1),
                end: AlignmentDirectional(-0.34, 1),
              ),
            ),
          ),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          // TODO: Crit: DocumentSnapshotをProviderで管理したらよいのでは、そうしたらrebuildされる
          future: FirebaseFirestore.instance
              .collection('User')
              .doc(_currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              // TODO: ローディング画面を実装
              // TODO: ローディング時間が長引く場合は、エラーハンドリング
              return Text('No Data');
            } else {
              DocumentSnapshot documentSnapshot =
                  snapshot.data as DocumentSnapshot;
              int score = documentSnapshot.get('score');
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 250, 250, 250),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // プロフ画像
                                MyProfilePictures(
                                  avatarUrl: _currentUser?.avatarUrl,
                                ),
                                // 概要欄
                                // TODO: Crit: greetingMessageの更新
                                MyIntroductionCard(
                                  documentSnapshot: documentSnapshot,
                                ),
                                // プロフィールスコア
                                MyProfileScore(
                                  score: score.toDouble(),
                                ),
                                // 自由記述欄
                                MyIntroduction(
                                  documentSnapshot: documentSnapshot,
                                ),
                                // 基本情報
                                MyProfileItemsList(
                                  categoryName: '基本情報',
                                  documentSnapshot: documentSnapshot,
                                  itemsList: ProfileItemParam().basicInfo,
                                ),
                                // 学歴・職種・外見
                                MyProfileItemsList(
                                  categoryName: '学歴・職種・外見',
                                  documentSnapshot: documentSnapshot,
                                  itemsList: ProfileItemParam().lifeStyleInfo,
                                ),
                                // 性格・趣味・生活
                                MyProfileItemsList(
                                  categoryName: '性格・趣味・生活',
                                  documentSnapshot: documentSnapshot,
                                  itemsList: ProfileItemParam().socialInfo,
                                ),
                                // 恋愛・結婚について
                                MyProfileItemsList(
                                  categoryName: '恋愛・結婚について',
                                  documentSnapshot: documentSnapshot,
                                  itemsList: ProfileItemParam().viewOfLove,
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  // TODO: 編集画面に遷移
                                  // TODO: デザインの修正、黄色ベース

                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          colors: <Color>[
                                            Color.fromARGB(255, 249, 229, 168),
                                            Color.fromARGB(255, 255, 225, 165),
                                            Color.fromARGB(255, 230, 189, 84),
                                          ],
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(28, 23, 23, 23),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(1, 1),
                                          ),
                                        ]),
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      'プロフィールを編集する',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyProfileEditPageWidget(
                                            documentSnapshot: snapshot.data
                                                as DocumentSnapshot,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

// 完成---------------------------------------------------------------------------------------------
// プロフィール画像
class MyProfilePictures extends ConsumerWidget {
  final String? avatarUrl;
  const MyProfilePictures({
    this.avatarUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: Container(
        height: 400,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: avatarUrl == null || avatarUrl == ''
                  ? Image.asset('assets/images/user1.jpg').image
                  : Image.file(File(avatarUrl!)).image,
              // TODO: High: 画像の切り抜き
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
