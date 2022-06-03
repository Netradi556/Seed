import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed_app/error_announce.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/view_model/user_controller.dart';

/*
    GekiteniusYogi/Seed/lib/ui/mypage/mypage.dart
    から編集画面に遷移
    遷移時に編集内容を保持するProviderの初期化処理を実装
    　初期化処理：ローカルデータの情報でProviderの値を上書き
    編集確定時には、保持している情報をローカルとFirestoreの両方に書き込み


*/

class UserProfileEditPageWidget extends ConsumerWidget {
  const UserProfileEditPageWidget({Key? key}) : super(key: key);

  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      // AppBarのデザイン修正
      // SilverAppBarに変更、丸みを帯びたデザインに変更
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        elevation: .6,
        title: Text('プロフィールの編集', style: TextStyle(color: appBarTextColor)),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePicturesEdit(),
          ],
        ),
      ),
    );
  }
}

class ProfilePicturesEdit extends ConsumerWidget {
  ProfilePicturesEdit({
    Key? key,
  }) : super(key: key);

  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: InkWell(
        onTap: () async {
          try {
            XFile? image = await ImagePicker.platform
                .getImage(source: ImageSource.gallery);
            File xfileToFile = File(image!.path);
            await locator
                .get<UserController>()
                .uploadProfilePicture(xfileToFile);
          } catch (e) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const ErrorPage();
                },
              ),
            );
          }
        },
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(_currentUser!.avatarUrl), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
