import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/ui/mypage/my_profile/mp_introduction.dart';
import 'package:seed_app/ui/mypage/my_profile/mp_introduction_card.dart';
<<<<<<< HEAD
import 'package:seed_app/ui/mypage/my_profile/mp_items_list.dart';
import 'package:seed_app/ui/mypage/my_profile/mp_score.dart';
=======
import 'package:seed_app/ui/mypage/my_profile/mp_score.dart';
import 'package:seed_app/ui/top/user_profile/up_introduction.dart';
import 'package:seed_app/ui/top/user_profile/up_introduction_card.dart';
import 'package:seed_app/ui/top/user_profile/up_items_list.dart';
import 'package:seed_app/ui/top/user_profile/up_score.dart';
>>>>>>> refs/remotes/origin/develop

class NewUserProfilePage extends StatelessWidget {
  NewUserProfilePage({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  // ロジック
  final DocumentSnapshot documentSnapshot;
  final ProfileItem profileItem = ProfileItem();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(73, 233, 241, 145),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // プロフ画像
<<<<<<< HEAD
              const MyProfilePictures(
=======
              const UserProfilePictures(
>>>>>>> refs/remotes/origin/develop
                avatarUrl:
                    '', // ==========================================FireStorageからパスを取得
              ),
              // 概要欄
<<<<<<< HEAD
              const MyIntroductionCard(),
              // プロフィールスコア
              const MyProfileScore(),
              // 自由記述欄
              const MyIntroduction(),
              // 基本情報
              MyProfileItemsList(
=======
              const UserIntroductionCard(),
              // プロフィールスコア
              const UserProfileScore(),
              // 自由記述欄
              const UserIntroduction(),
              // 基本情報
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '恋愛・結婚について',
                itemsList: profileItem.viewOfLove,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewProfilePictures extends ConsumerWidget {
  final String? avatarUrl;
  const NewProfilePictures({
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
                  ? Image.asset('assets/images/user1.jpg')
                      .image // ==============================================プロフィール画像未設定の場合の画像
                  : Image.file(File(avatarUrl!)).image,
              fit: BoxFit.fill),
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
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
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
class UserProfilePageWidget extends ConsumerWidget {
  UserProfilePageWidget({Key? key}) : super(key: key);

  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  final ProfileItem profileItem = ProfileItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // プロフ画像
<<<<<<< HEAD
              const MyProfilePictures(
=======
              const UserProfilePictures(
>>>>>>> refs/remotes/origin/develop
                avatarUrl:
                    '', // ==========================================FireStorageからパスを取得
              ),
              // 概要欄
              const MyIntroductionCard(),
              // プロフィールスコア
              const MyProfileScore(),
              // 自由記述欄
              const MyIntroduction(),
              // 基本情報
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
<<<<<<< HEAD
              MyProfileItemsList(
=======
              UserProfileItemsList(
>>>>>>> refs/remotes/origin/develop
                itemName: '恋愛・結婚について',
                itemsList: profileItem.viewOfLove,
              )
            ],
          ),
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
// 完成---------------------------------------------------------------------------------------------
// プロフィール画像
<<<<<<< HEAD
class MyProfilePictures extends ConsumerWidget {
  final String? avatarUrl;
  const MyProfilePictures({
=======
class UserProfilePictures extends ConsumerWidget {
  final String? avatarUrl;
  const UserProfilePictures({
>>>>>>> refs/remotes/origin/develop
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
                  ? Image.asset('assets/images/user1.jpg')
                      .image // ==============================================プロフィール画像未設定の場合の画像
                  : Image.file(File(avatarUrl!)).image,
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
