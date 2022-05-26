import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/basic_info.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/introduction.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/introduction_card.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/lifestyle_info.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/profile_picture.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/profile_score.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/social_info.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/view_of_love.dart';

/*
  ユーザーのプロフィールを表示する画面
  登録済みのプロフィールを表示する他、ログインステータスの表示も反映する



*/

class UserProfilePageWidget extends ConsumerWidget {
  const UserProfilePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // AppBarのデザイン修正
          // SilverAppBarに変更、丸みを帯びたデザインに変更
          appBar: GradientAppBar(
            gradient: const LinearGradient(
              colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
              stops: [0, 1],
              begin: AlignmentDirectional(0.34, -1),
              end: AlignmentDirectional(-0.34, 1),
            ),
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              elevation: .6,
              title: const Text(
                'マイプロフィール',
                style: TextStyle(color: Colors.black87),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),

          // プロフの項目別にWidget切り出し→実装
          body: SingleChildScrollView(
            child: Column(
              children: const [
                // プロフ画像
                ProfilePictures(),
                // 概要欄
                IntroductionCard(),
                // プロフィールスコア
                ProfileScore(),
                // 自由記述欄
                Introduction(),
                BasicInfo(),
                SocialInfo(),
                // プロフパラメータ
                LifeStyleInfo(),
                ViewOfLove()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 完成---------------------------------------------------------------------------------------------

// AppBarのグラディエーション対応
class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  GradientAppBar({
    Key? key,
    required this.gradient,
    required this.appBar,
  })  : preferredSize = appBar.preferredSize,
        super(key: key);

  final Gradient gradient;
  final AppBar appBar;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: gradient),
          height: preferredSize.height,
        ),
        appBar,
      ],
    );
  }
}
