// Package
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Riverpod
import 'package:seed_app/view_model/auth_provider.dart';

// PageWidgets
import 'package:seed_app/ui/bottom_navigation/navigtion_controller.dart';
import 'forgot_pass.dart';
import 'introduction.dart';

String _backgroundImagePath = 'assets/images/sea.jpeg';
String _logoImagePath = 'assets/images/logo.jpg';

// Googleを使ってサインインするメソッド
Future<UserCredential> signInWithGoogle() async {
  // 認証フローのトリガー
  final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: [
    'email',
  ]).signIn();
  // リクエストから、認証情報を取得
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  // クレデンシャルを新しく作成
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // サインインしたら、userCredentialを返す
  return FirebaseAuth.instance.signInWithCredential(credential);
}

class AuthPageWidget extends ConsumerWidget {
  const AuthPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Align(
        alignment: AlignmentDirectional(-0.14, -0.08),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x19444D59),
            image: DecorationImage(
              fit: BoxFit.fitWidth,

              // ロゴイメージ
              image: Image.asset(_backgroundImagePath).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 110),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // ロゴ表示
                AuthLogoPaddingWidget(),
                // メールアドレス入力
                AuthEmailboxPaddingWidget(),
                // パスワード入力
                AuthPassboxPaddingWidget(),
                // ログインボタン
                AuthLoginEbuttonWidget(),
                // "アカウントを持ってない場合？"のテキスト
                AuthFoggotpassPaddingWidget(),
                // アカウント新規登録のボタン
                AuthCreatePaddingWidget(),
                // Googleログインのボタン
                AuthGoogleloginPaddingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthLogoPaddingWidget extends StatelessWidget {
  const AuthLogoPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
      child: Image.asset(
        _logoImagePath,
        width: 160,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AuthEmailboxPaddingWidget extends ConsumerWidget {
  const AuthEmailboxPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            onChanged: (String value) => email.state = value,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'メールアドレス',
              // Extensionを利用予定
              labelStyle: TextStyle(color: Colors.amberAccent),
              hintText: 'Enter your email...',
              // Extensionを利用予定
              hintStyle: TextStyle(color: Colors.amberAccent),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: const Color(0x98FFFFFF),
              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
            ),
            style: const TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}

class AuthPassboxPaddingWidget extends ConsumerWidget {
  const AuthPassboxPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(passwordProvider.notifier);

    bool passowrdVisibility = true;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            onChanged: (String value) => password.state = value,
            obscureText: passowrdVisibility,
            decoration: InputDecoration(
              labelText: 'パスワード',
              // Extensionを利用予定
              labelStyle: TextStyle(color: Colors.amberAccent),
              hintText: 'Enter your password...',
              // Extensionを利用予定
              hintStyle: TextStyle(color: Colors.amberAccent),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Color(0x98FFFFFF),
              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
              suffixIcon: InkWell(
                onTap: () => passowrdVisibility = !passowrdVisibility,
                child: Icon(passowrdVisibility
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
            style: const TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}

class AuthLoginEbuttonWidget extends ConsumerWidget {
  const AuthLoginEbuttonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoText = ref.watch(infoTextProvider.notifier);
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    return ElevatedButton(
      child: const Text('ログイン'),
      onPressed: () async {
        try {
          final FirebaseAuth auth = FirebaseAuth.instance;
          final UserCredential user = await auth.signInWithEmailAndPassword(
              email: email.state, password: password.state);
          if (user.additionalUserInfo!.isNewUser) {
            await Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return IntroductionPage();
            }));
          } else {
            await Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return NavigationPageController();
            }));
          }
        } catch (e) {
          infoText.state = "ログインに失敗しました${e.toString()}";
        }
      },
    );
  }
}

class AuthCreatePaddingWidget extends StatelessWidget {
  const AuthCreatePaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
      child: SizedBox(
        width: 140,
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            await Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return NavigationPageController();
            }));
          },
          child: const Text('アカウント新規作成'),
          style: const ButtonStyle(),
        ),
      ),
    );
  }
}

class AuthFoggotpassPaddingWidget extends StatelessWidget {
  const AuthFoggotpassPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Text(
              'Forgot mail/pass',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            width: 160,
            height: 40,
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ForgotPassPageWidget();
                }));
              },
              child: const Text('メールアドレス・パスワードの再設定'),
              style: const ButtonStyle(),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthGoogleloginPaddingWidget extends StatelessWidget {
  const AuthGoogleloginPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isUserNew = true;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
      child: SizedBox(
        width: 140,
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            try {
              UserCredential? userCredential;
              userCredential = await signInWithGoogle();
              if (userCredential.additionalUserInfo!.isNewUser) {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntroductionPage(),
                  ),
                  (r) => false,
                );
              } else {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationPageController(),
                  ),
                  (r) => false,
                );
              }
            } on FirebaseAuthException catch (e) {
              print('FirebaseAuthException');
              print('${e.code}');
            } on Exception catch (e) {
              print('Other Exception');
              print('$e');
            }
          },
          child: const Text('Google Sign in'),
          style: const ButtonStyle(),
        ),
      ),
    );
  }
}
