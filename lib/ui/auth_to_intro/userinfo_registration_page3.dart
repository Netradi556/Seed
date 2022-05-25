// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PageWidgets
import 'package:seed_app/ui/bottom_navigation/navigtion_controller.dart';

// Riverpod
import 'package:seed_app/view_model/profile_provider.dart';

/*
  Todo(High)
  「登録を完了する」ボタンを押下した時に、確認のポップアップを表示
  確認内容には変更不可の属性を表示する


*/

class RegistrationPage3 extends ConsumerWidget {
  const RegistrationPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paramBirthDate = ref.watch(profileBirthdateProvider.state);
    final paramSex = ref.watch(profileSexProvider.state);
    final paramName = ref.watch(profileNameProvider.state);
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

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
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(userId.toString())
                        .set({
                      'handleName': paramName.state.toString(),
                      'sex': paramSex.state.toString(),
                      'birthDate': paramBirthDate.state.toString(),
                    });
                    await Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NavigationPageController();
                    }));
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
