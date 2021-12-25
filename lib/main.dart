// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/view_model/Provider_auth.dart';
import 'package:seed_app/ui/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}

class LoginPage extends ConsumerWidget {
  // メッセージ表示用
  // Providerではここに記述していた
  // String infoText = '';

  // 入力したメールアドレス・パスワード
  // String email = '';
  // String password = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // メッセージ表示用
    final infoText = ref.watch(infoTextProvider);
    // 入力したメールアドレス・パスワード
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    // ユーザー情報を受け取る
    // Riverpodの導入に伴い不要
    // final UserState userState = Provider.of<UserState>(context);

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // メールアドレス入力
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  // Riverpod導入に伴ってsetState()が不要になった
                  //setState(() {
                  //  email = value;
                  //});

                  // Providerから値を更新
                  ref.read(emailProvider.notifier).state = value;
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  //  setState(() {
                  //    password = value;
                  //  });

                  // Providerから値を更新
                  ref.read(passwordProvider.notifier).state = value;
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        // メール・パスワードでユーザー登録
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final result =
                            await auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        // ユーザー情報を更新
                        // userState.setUser(result.user!); Riverpod導入に伴って不要に
                        ref.read(userProvider.notifier).state = result.user;
                      } catch (e) {
                        // ユーザー登録に失敗した場合
                        // Provider導入に伴って不要に
                        // setState(() {
                        //  infoText = "登録に失敗しました: ${e.toString()}";
                        // });
                        ref.read(infoTextProvider.notifier).state =
                            "登録に失敗しました: ${e.toString()}";
                      }
                    },
                    child: Text('ユーザー登録')),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                // ログイン登録ボタン
                child: OutlinedButton(
                    onPressed: () async {
                      try {
                        // メール・パスワードでログイン
                        final FirebaseAuth auth = FirebaseAuth.instance;
/*                         final result = await auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        // ユーザー情報を更新
                        userState.setUser(result.user!); */
                        // ログインに成功した場合
                        // チャット画面に遷移＋ログイン画面を破棄

                      } catch (e) {
                        // ログインに失敗した場合
                        // Providerから値を更新
                        ref.read(infoTextProvider.notifier).state =
                            "ログインに失敗しました${e.toString()}";
/*                         setState(() {
                          infoText = "ログインに失敗しました${e.toString()}";
                        }); */
                      }
                    },
                    child: Text('ログイン')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
