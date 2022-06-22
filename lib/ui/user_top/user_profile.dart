import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/ui/user_menu_to_pages/my_profile/mp_introduction.dart';
import 'package:seed_app/ui/user_menu_to_pages/my_profile/mp_introduction_card.dart';
import 'package:seed_app/ui/user_menu_to_pages/my_profile/mp_items_list.dart';
import 'package:seed_app/ui/user_menu_to_pages/my_profile/mp_score.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

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
              const ProfilePictures(
                avatarUrl:
                    '', // ==========================================FireStorageからパスを取得
              ),
              // 概要欄
              const IntroductionCard(),
              // プロフィールスコア
              const ProfileScore(),
              // 自由記述欄
              const Introduction(),
              // 基本情報
              ProfileItemsList(
                itemName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
              ProfileItemsList(
                itemName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
              ProfileItemsList(
                itemName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
              ProfileItemsList(
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

// 完成---------------------------------------------------------------------------------------------
// プロフィール画像
class ProfilePictures extends ConsumerWidget {
  final String? avatarUrl;
  const ProfilePictures({
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
              image: avatarUrl == null
                  ? Image.asset('assets/images/user1.jpg')
                      .image // ==============================================プロフィール画像未設定の場合の画像
                  : Image.file(File(avatarUrl!)).image,
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
