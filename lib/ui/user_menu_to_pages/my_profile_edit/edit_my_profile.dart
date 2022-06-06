import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed_app/error_announce.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/provider/profile_provider.dart';
import 'package:seed_app/ui/user_menu_to_pages/my_profile_edit/edit_items_list.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
    GekiteniusYogi/Seed/lib/ui/mypage/mypage.dart
    から編集画面に遷移
    遷移時に編集内容を保持するProviderの初期化処理を実装
    　初期化処理：ローカルデータの情報でProviderの値を上書き
    編集確定時には、保持している情報をローカルとFirestoreの両方に書き込み


*/

class MyProfileEditPageWidget extends ConsumerWidget {
  MyProfileEditPageWidget({Key? key}) : super(key: key);

  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  final UserModel? _currentUser = locator.get<UserController>().currentUser;
  final ProfileItem profileItem = ProfileItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChanged = ref.watch(profileIsChanged.state);
    return Material(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        // AppBarのデザイン修正
        // SilverAppBarに変更、丸みを帯びたデザインに変更
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              if (isChanged.state == true) {
                isChanged.state = false;

                final SharedPreferences pref =
                    await SharedPreferences.getInstance();

                final List<String> allItemName = profileItem.basicInfo +
                    profileItem.lifeStyleInfo +
                    profileItem.socialInfo +
                    profileItem.viewOfLove;

                // ==============================================================任意で追加したかったらここ
                Map<String, String> editedContents = {};

                for (var i = 0; i < allItemName.length; i++) {
                  String? param = pref.getString(allItemName[i]);

                  if (param == null) {
                    param = '';
                  } else {
                    // do nothing
                  }
                  editedContents.addAll({
                    allItemName[i]: param,
                  });
                }

                await locator
                    .get<UserController>()
                    .uploadEditedContents(editedContents);

                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            },
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
              ProfilePicturesEdit(
                avatarUrl: _currentUser?.avatarUrl,
              ),
              EditProfileItemsList(
                itemName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
              EditProfileItemsList(
                itemName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
              EditProfileItemsList(
                itemName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
              EditProfileItemsList(
                itemName: '恋愛・結婚について',
                itemsList: profileItem.viewOfLove,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 230, 232, 212)),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: Center(
                        child: Text(
                      '自己紹介文の編集欄',
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePicturesEdit extends ConsumerWidget {
/*
  参考情報
  Flutter Tutorial - Image Picker From Camera & Gallery | The Right Way [2021] Pick Images & Videos
  https://www.youtube.com/watch?v=MSv38jO4EJk&t=55&ab_channel=JohannesMilke



*/

  final String? avatarUrl;

  ProfilePicturesEdit({
    this.avatarUrl,
    Key? key,
  }) : super(key: key);

  // final UserModel? _currentUser = locator.get<UserController>().currentUser;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: InkWell(
        onTap: () async {
          try {
            XFile? image = await _picker.pickImage(source: ImageSource.gallery);

            final imageTemporary = File(image!.path);
            await locator
                .get<UserController>()
                .saveLocalProfilePicture(imageTemporary);

            await locator
                .get<UserController>()
                .uploadProfilePicture(imageTemporary);
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
                image: avatarUrl == null
                    ? Image.asset('assets/images/user1.jpg').image
                    : Image.file(File(avatarUrl!)).image,
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
