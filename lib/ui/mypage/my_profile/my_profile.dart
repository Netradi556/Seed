import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/provider/profile_provider.dart';
import 'package:seed_app/repository/firestore_repo.dart';
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

  // デザイン関係
  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  // 処理関係
  final FireStoreRepo fireStoreRepo = FireStoreRepo();
  final UserModel? _currentUser = locator.get<UserController>().currentUser;
  final ProfileItemJAP profileItem = ProfileItemJAP();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DocumentSnapshot documentSnapshot;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
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

        // プロフの項目別にWidget切り出し→実装
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('User')
                      .doc(_currentUser!.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Text('No Data');
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // プロフ画像
                          MyProfilePictures(
                            avatarUrl: _currentUser?.avatarUrl,
                          ),
                          // 概要欄
                          const MyIntroductionCard(),
                          // プロフィールスコア
                          const MyProfileScore(),
                          // 自由記述欄
                          const MyIntroduction(),
                          // 基本情報
                          MyProfileItemsList(
                            categoryName: '基本情報',
                            documentSnapshot: snapshot.data as DocumentSnapshot,
                            itemsList: ProfileItemParam().basicInfo,
                          ),
                          // 学歴・職種・外見
                          MyProfileItemsList(
                            categoryName: '学歴・職種・外見',
                            documentSnapshot: snapshot.data as DocumentSnapshot,
                            itemsList: ProfileItemParam().lifeStyleInfo,
                          ),
                          // 性格・趣味・生活
                          MyProfileItemsList(
                            categoryName: '性格・趣味・生活',
                            documentSnapshot: snapshot.data as DocumentSnapshot,
                            itemsList: ProfileItemParam().socialInfo,
                          ),
                          // 恋愛・結婚について
                          MyProfileItemsList(
                            categoryName: '恋愛・結婚について',
                            documentSnapshot: snapshot.data as DocumentSnapshot,
                            itemsList: ProfileItemParam().viewOfLove,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              height: 30,
              color: Color.fromARGB(31, 235, 119, 119),
              child: ElevatedButton(
                // TODO: 編集画面に遷移
                // TODO: デザインの修正、黄色ベース
                onPressed: () {},
                child: const Text('プロフィールの編集'),
              ),
            ),
            const SizedBox(height: 60)
          ],
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
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
