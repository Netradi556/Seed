// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/repository/firestore_repo.dart';

// PageWidgets
import 'package:seed_app/ui/navigation_controller.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

/* Todo
  「登録を完了する」ボタンを押下した時に、確認のポップアップを表示
  確認内容には変更不可の属性を表示する

  UserCardに表示するaboutパラメータも登録する


  ユーザーのプロフィール画像の初期値を設定しても良さそう



*/

class RegistrationPage3 extends ConsumerWidget {
  RegistrationPage3({Key? key}) : super(key: key);

  final UserController userController = UserController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paramBirthDate = ref.watch(profileBirthdateProvider.state);
    final paramSex = ref.watch(profileSexProvider.state);
    final paramName = ref.watch(profileNameProvider.state);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 40),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 241, 255, 161),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 10.0,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/logo.jpg'),
                  ),
                ),
                width: 400, // 余白にフィットさせる方法？
                height: 300,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text('登録を完了する'),
                  onPressed: () async {
                    // ==========================================================================aboutパラメタを保持するProviderに初期値投入

                    if (paramSex.state.toString() == '未選択' ||
                        paramName.state.toString() == '' ||
                        paramBirthDate.state == DateTime(1900, 1, 1)) {
                      // ================================情報が選択されていなかった場合は、警告を表示し登録させない

                      // ignore: avoid_print
                      print(paramSex.state.toString());
                      // ignore: avoid_print
                      print(paramName.state.toString());
                      // ignore: avoid_print
                      print(paramBirthDate.state.toString());
                    } else {
                      try {
                        // TODO: ageプロパティの登録
                        // TODO: paramBirthDateの型修正 FireBase用の型に変更する必要あるかも？
                        await userController.firstUploadEditedContents(
                          {
                            'handleName': paramName.state.toString(),
                            'sex': paramSex.state.toString(),
                            'birthDate': paramBirthDate.state.toString(),
                          },
                        );

                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return NavigationPageController();
                            },
                          ),
                        );
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
