import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed_app/error_announce.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/provider/profile_provider.dart';
import 'package:seed_app/ui/mypage/my_profile/edit_my_profile/edit_mp_items_list.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
  Todo
  AppBarのデザイン修正：SilverAppBarに変更、丸みを帯びたデザインに変更

  画面の遷移元をmy_profile.dartに変更


*/

// TODO: 編集を確定したときに、AutoDisposeでProviderの状態を破棄する

class NewMyProfileEditPageWidget extends ConsumerWidget {
  NewMyProfileEditPageWidget({Key? key}) : super(key: key);

  // デザイン
  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
  final Color backgroundColor = const Color(0xFFF5F5F5);

  // 処理
  final UserModel? _currentUser = locator.get<UserController>().currentUser;
  final ProfileItemJAP profileItem = ProfileItemJAP();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChanged = ref.watch(profileIsChangedAuto.state);
    final editingContents = ref.watch(profileEditingContents);
    return Material(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              if (isChanged.state) {
                isChanged.state = false;
                // TODO: Crit: FireStoreへの登録処理を実装
                print(editingContents);
                await locator
                    .get<UserController>()
                    .NEWuploadEditedContents(editingContents);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfilePicturesEdit(
                avatarUrl: _currentUser?.avatarUrl,
              ),
              NewEditProfileItemsList(
                categoryName: '基本情報',
                itemsList: ProfileItemParam().basicInfo,
              ),
              EditProfileItemsList(
                categoryName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
              EditProfileItemsList(
                categoryName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
              EditProfileItemsList(
                categoryName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
              EditProfileItemsList(
                categoryName: '恋愛・結婚について',
                itemsList: profileItem.viewOfLove,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 232, 212)),
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

class MyProfileEditPageWidget extends ConsumerWidget {
  MyProfileEditPageWidget({Key? key}) : super(key: key);

  // デザイン
  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
  final Color backgroundColor = const Color(0xFFF5F5F5);

  // 処理
  final UserModel? _currentUser = locator.get<UserController>().currentUser;
  final ProfileItemJAP profileItem = ProfileItemJAP();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChanged = ref.watch(profileIsChanged.state);
    return Material(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              if (isChanged.state) {
                isChanged.state = false;

//===============================ここから====================================================
// user_controller.dartに処理を記述：
// いづれにせよ、items_list.dartではProviderを利用して表示する
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();

                // 項目名を保存するList
                // TODO: パラメータ名を和名から英名に変更
                final List<String> allItemName = profileItem.basicInfo +
                    profileItem.lifeStyleInfo +
                    profileItem.socialInfo +
                    profileItem.viewOfLove;

                // Firestoreに登録する用のMap
                Map<String, String> editedContents = {};

                // 項目数だけループしてMapに追加していく
                for (var i = 0; i < allItemName.length; i++) {
                  // 変更内容をparamに
                  String paramItemName = allItemName[i];
                  String? paramProperty = pref.getString(allItemName[i]);

                  // paramPropertyが空だった場合、つまり編集内容がなかった場合
                  if (paramProperty == null) {
                    paramProperty = '';
                  } else {
                    // do nothing
                  }

                  editedContents.addAll({
                    paramItemName: paramProperty,
                  });
                }

                await locator
                    .get<UserController>()
                    .uploadEditedContents(editedContents);
//===========================ここまで==================================================

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
                categoryName: '基本情報',
                itemsList: profileItem.basicInfo,
              ),
              // 学歴・職種・外見
              EditProfileItemsList(
                categoryName: '学歴・職種・外見',
                itemsList: profileItem.socialInfo,
              ),
              // 性格・趣味・生活
              EditProfileItemsList(
                categoryName: '性格・趣味・生活',
                itemsList: profileItem.lifeStyleInfo,
              ),
              // 恋愛・結婚について
              EditProfileItemsList(
                categoryName: '恋愛・結婚について',
                itemsList: profileItem.viewOfLove,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 232, 212)),
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
            // TODO: Crit: 画像未選択時には元の画面に戻るようにする
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
                // TODO: High: 画像の切り抜き
                fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
