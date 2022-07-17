import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/profile_provider.dart';
import 'package:seed_app/ui/mypage/my_profile/edit_my_profile/edit_my_profile.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import 'package:seed_app/ui/mypage/menu_importer.dart';
import 'package:seed_app/ui/mypage/mypage_menu.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';

/*
  Todo
  Stackでごまかしていたものを整理⇒プロフィールのパーツの配置を決定・調整

  ハンドルネームの表示をFirebaseから取得した値にする
  ⇒auth_repo.dartのgetUserを修正する



*/

class MypagePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  MypagePageWidget({Key? key}) : super(key: key);
  final Color backgroundColor = const Color.fromARGB(210, 231, 254, 250);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // プロフィールメニュー
            Material(
              elevation: 1,
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(209, 245, 207, 55),
                      Color.fromARGB(255, 251, 229, 152)
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0.3, -2),
                    end: AlignmentDirectional(-0.3, 0.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    // プロフィール画像
                    Align(
                      alignment: const AlignmentDirectional(-0.8, 0),
                      child: Avatar(
                        avatarUrl: _currentUser?.avatarUrl,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ハンドルネーム
                        Text(
                          _currentUser!.handleName.toString(),
                          style: FlutterFlowTheme.bodyText1.override(
                            // =======================FlutterFlowのThemeから変更
                            fontFamily: 'Poppins',
                            fontSize: 24,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MyProfilePageWidget();
                              },
                            ),
                          ),
                          child: Text(
                            'プロフィールを確認する',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1.override(
                              // =======================FlutterFlowのThemeから変更
                              fontFamily: 'Poppins',
                              color: const Color(
                                  0xFF646CF2), //==================================変数で
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 10,
              color: Color.fromARGB(0, 100, 107, 242),
            ),
            // 告知欄
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color:
                    Color(0xFFFC8585), //==================================変数で
              ),
              child: Text(
                '告知欄\n',
                style: FlutterFlowTheme
                    .bodyText1, // // =======================FlutterFlowのThemeから変更
              ),
            ),
            // メニュー
            const MyPageMenu(),
          ],
        ),
      ),
    );
  }
}

// 完成-----------------------------------------
class Avatar extends StatelessWidget {
  final String? avatarUrl;
  final void Function()? onTap;

  const Avatar({
    Key? key,
    this.avatarUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: avatarUrl == null
            ? const CircleAvatar(
                radius: 60.0,
                child: Icon(Icons.photo_camera),
              )
            : CircleAvatar(
                radius: 60.0,
                backgroundImage: Image.file(File(avatarUrl!)).image,
              ),
      ),
    );
  }
}
