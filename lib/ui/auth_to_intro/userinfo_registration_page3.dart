// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PageWidgets
import 'package:seed_app/ui/bottom_navigation/navigtion_controller.dart';

/*
  Todo(High)
  「登録を完了する」ボタンを押下した時に、確認のポップアップを表示
  確認内容には変更不可の属性を表示する


*/

class RegistrationPage3 extends ConsumerWidget {
  const RegistrationPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF153),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Color(0xFFD2F580),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              child: Image.asset('assets/images/logo.jpg'),
              width: 400, // 余白にフィットさせる方法？
              height: 300,
              color: Color(0xFFD2F580),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100,
              color: Color(0xFFD2F580),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text('登録を完了する'),
                  onPressed: () async {
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
