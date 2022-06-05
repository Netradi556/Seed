// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/controller/user_controller.dart';

// PageWidgets
import 'package:seed_app/ui/navigation_controller.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
  Todo(High)
  「登録を完了する」ボタンを押下した時に、確認のポップアップを表示
  確認内容には変更不可の属性を表示する


*/

class RegistrationPage3 extends ConsumerWidget {
  RegistrationPage3({Key? key}) : super(key: key);

  final UserController userController = UserController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paramBirthDate = ref.watch(profileBirthdateProvider.state);
    final paramSex = ref.watch(profileSexProvider.state);
    final paramName = ref.watch(profileNameProvider.state);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF153),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: const Color(0xFFD2F580),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              child: Image.asset('assets/images/logo.jpg'),
              width: 400, // 余白にフィットさせる方法？
              height: 300,
              color: const Color(0xFFD2F580),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100,
              color: const Color(0xFFD2F580),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text('登録を完了する'),
                  onPressed: () async {
                    if (paramSex.state.toString() == '未選択' ||
                        paramName.state.toString() == '' ||
                        paramBirthDate.state.toString() == '') {
                      // ================================情報が選択されていなかった場合は、警告を表示し登録させない

                      // ignore: avoid_print
                      print(paramSex.state.toString());
                      // ignore: avoid_print
                      print(paramName.state.toString());
                      // ignore: avoid_print
                      print(paramBirthDate.state.toString());
                    } else {
                      try {
                        final SharedPreferences pref =
                            await SharedPreferences.getInstance();

                        pref.setString(
                            'handleName', paramName.state.toString());
                        pref.setString('sex', paramSex.state.toString());
                        pref.setString(
                            'birthDate', paramBirthDate.state.toString());

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
          ),
        ],
      ),
    );
  }
}
