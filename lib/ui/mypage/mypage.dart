import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/user_menu_to_pages/my_profile_edit/edit_my_profile.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import 'package:seed_app/ui/user_menu_to_pages/user_menu_importer.dart';
import 'package:seed_app/ui/mypage/mypage_menu.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';

/*
  Todo
  ・プロフィール画像はCircleAvatar Widgetを利用したほうがよさそう
  ・アイコンをボタンにするときはIconButton Widgetを利用したほうがよさそう
  ・Widgetの切り出し
  ・Riverpodの導入
  ・アイコンの設定
  ・
*/

class MypagePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  MypagePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // プロフィールメニュー
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0x7AEBC24E),
              ),
              child: Stack(
                children: [
                  // プロフィール画像
                  Align(
                    alignment: const AlignmentDirectional(-0.8, 0),
                    child: Avatar(
                      avatarUrl: _currentUser?.avatarUrl,
                      onTap: () {},
                    ),
                  ),
                  // ハンドルネーム
                  Align(
                    alignment: const AlignmentDirectional(0.3, -0.4),
                    child: Text(
                      _currentUser!.displayName.toString(),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                      ),
                    ),
                  ),
                  // プロフィール編集ボタン
                  Align(
                    alignment: const AlignmentDirectional(-0.05, 0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MyProfileEditPageWidget();
                          },
                        ),
                      ),
                      child: Text(
                        'Edit profile',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: const Color(0xFF646CF2),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.55, 0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MyProfilePageWidget();
                          },
                        ),
                      ),
                      child: Text(
                        'my profile',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: const Color(0xFF646CF2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 告知欄
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFFC8585),
              ),
              child: Text(
                '告知欄\n',
                style: FlutterFlowTheme.bodyText1,
              ),
            ),
            // メニュー
            MyPageMenu(),
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
                radius: 50.0,
                child: Icon(Icons.photo_camera),
              )
            : CircleAvatar(
                radius: 50.0,
                backgroundImage: Image.file(File(avatarUrl!)).image,
              ),
      ),
    );
  }
}

// 未完成・整理予定------------------------------

class GetUserName extends StatelessWidget {
  const GetUserName({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('user');

    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['handleName']}");
        }

        return const Text("loading");
      },
    );
  }
}
