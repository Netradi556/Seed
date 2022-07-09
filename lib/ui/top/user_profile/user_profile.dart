import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/ui/top/user_profile/up_introduction.dart';
import 'package:seed_app/ui/top/user_profile/up_introduction_card.dart';
import 'package:seed_app/ui/top/user_profile/up_items_list.dart';
import 'package:seed_app/ui/top/user_profile/up_score.dart';

class NewUserProfilePage extends StatelessWidget {
  NewUserProfilePage({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  // ロジック
  final DocumentSnapshot documentSnapshot;
  final ProfileItemJAP profileItem = ProfileItemJAP();

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
              const NewProfilePictures(
                avatarUrl:
                    '', // ==========================================FireStorageからパスを取得
              ),
              // 概要欄
              UserIntroductionCard(documentSnapshot: documentSnapshot),
              // プロフィールスコア
              UserProfileScore(documentSnapshot: documentSnapshot),
              // 自由記述欄
              const UserIntroduction(),
              // 基本情報
              UserProfileItemsList(
                itemName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
              UserProfileItemsList(
                itemName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
              UserProfileItemsList(
                itemName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
              UserProfileItemsList(
                itemName: '恋愛・結婚について',
                itemsList: profileItem.viewOfLove,
              )
            ], // TODO : いいね！送信ボタンを配置する
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
