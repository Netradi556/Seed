import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/user_profile_edit.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import 'package:seed_app/ui/user_menu_to_pages/user_menu_importer.dart';
import 'package:seed_app/ui/mypage/mypage_menu.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/view_model/user_controller.dart';
import 'package:seed_app/locator.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

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
  final String? userId = FirebaseAuth.instance.currentUser?.uid;
  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paramName = ref.watch(profileNameProvider.state);
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
                    alignment: AlignmentDirectional(-0.8, 0),
                    child: Avatar(
                      avatarUrl: _currentUser?.avatarUrl,
                      onTap: () async {
                        XFile? image = await ImagePicker.platform
                            .getImage(source: ImageSource.gallery);
                        File xfileToFile = File(image!.path);
                        await locator
                            .get<UserController>()
                            .uploadProfilePicture(xfileToFile);
                      },
                    ),
                  ),
                  // ハンドルネーム
                  Align(
                    alignment: const AlignmentDirectional(0.3, -0.4),
                    child: Text(
                      GetUserName(
                        documentId: userId.toString(),
                      ).toString(), // paramName.state,
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
                      onTap: () =>
                          // Providerの初期化処理を挟む===========================================
                          Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return UserProfileEditPageWidget();
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
                            return UserProfilePageWidget();
                          },
                        ),
                      ),
                      child: InkWell(
                        onTap: () =>
                            // Providerの初期化処理

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                          return UserProfilePageWidget();
                        })),
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

  const Avatar({this.avatarUrl, this.onTap});

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
                backgroundImage: NetworkImage(avatarUrl!),
              ),
      ),
    );
  }
}

// 未完成・整理予定------------------------------

class GetUserName extends StatelessWidget {
  const GetUserName({required this.documentId});

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
