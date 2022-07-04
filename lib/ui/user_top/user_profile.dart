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
  const NewUserProfilePage({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);
  final DocumentSnapshot documentSnapshot;

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
              const UserProfileScore(),
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
