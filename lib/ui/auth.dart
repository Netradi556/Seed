// Login or Sing up

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/view_model/Provider_auth.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class AuthPage extends ConsumerWidget {
  final List<TabInfo> _tabs = [
    TabInfo("Sign in", _SignIn()),
    TabInfo("Sign up", _SingUp())
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color(0xFF42A5F5),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                  isScrollable: false,
                  tabs: _tabs
                      .map((TabInfo tab) => Tab(text: tab.label))
                      .toList()),
            ],
          ),
        ));
  }
}

class _SignIn extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Column(
      children: [
        Container(), // ロゴ表示領域
        TextFormField(
          decoration: InputDecoration(labelText: 'メールアドレス'),
          onChanged: (String value) {
            email.update();
          },
        ), // メールアドレス入力ボックス
        SizedBox(), // スペーサー
        TextFormField(), // パスワード入力ボックス
        Container(), // msg表示領域s
        Container(), // ユーザー登録ボタン
      ],
    );
  }
}

class _SingUp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column();
  }
}
