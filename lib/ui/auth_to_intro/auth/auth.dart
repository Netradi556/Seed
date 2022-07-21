// Package

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:seed_app/controller/user_controller_before_login.dart';
import 'package:seed_app/locator.dart';

// Riverpod
import 'package:seed_app/provider/auth_provider.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/ui/auth_to_intro/auth/create_account.dart';

// PageWidgets
import 'package:seed_app/ui/navigation_controller.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'forgot_pass.dart';
import '../intro/introduction.dart';

String _logoImagePath = 'assets/images/logo.jpg';

/* Todo
  All：
  EmailTextFormとPasswordTextFormのWidgetをまとめる
  →バリデーションを実装するなら不要？

  GoogleSignInButton：
  ボタンのデザインをGoogleのボタンに変更する

  EmailTextForm：
  Colorの指定を変数にする

  PasswordTextForm：
  Colorの指定を変数にする

*/

class AuthPageWidget extends ConsumerWidget {
  const AuthPageWidget({Key? key}) : super(key: key);
  final Color backgroundColor = const Color.fromRGBO(249, 225, 45, 0.988);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ロゴ表示
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                child: Image.asset(_logoImagePath,
                    width: 160, height: 140, fit: BoxFit.cover)),
            // メールアドレス入力
            const EmailTextForm(),
            // パスワード入力
            const PasswordTextForm(),
            // ログインボタン
            MailAddressLogInButton(),
            Container(
                height: 35,
                child: const Text('or'),
                alignment: Alignment.center),
            // Googleログインのボタン
            GoogleSignInButton(),

            // アカウント新規登録のボタン
            const CreateAccount(),
            const SizedBox(height: 40),
            const ForgotPassword(),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({Key? key}) : super(key: key);

  final AuthRepo authRepo = AuthRepo();
  final UserControllerBeforeLogin _userControllerBeforeLogin =
      locator.get<UserControllerBeforeLogin>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: SignInButton(
        Buttons.GoogleDark,
        // TODO: lastLoginパラメータの更新処理を追加
        onPressed: () async {
          // TODO: Crit: 通信不良時のエラー処理を実装
          try {
            final UserCredential userCredential =
                await authRepo.signInWithGoogle();

            if (userCredential.additionalUserInfo!.isNewUser) {
              // Userコレクションにドキュメント作成
              // _userController.setUserDocument();
              _userControllerBeforeLogin.setUserDocument();

              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => IntroductionPage(),
                ),
                (r) => false,
              );
            } else {
              //===================================================================Providerで状態を作成
              // _userController.initializeLocalProfilePicturePath();

              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationPageController(),
                ),
                (r) => false,
              );
            }
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print('FirebaseAuthException');
            // ignore: avoid_print
            print(e.code);
          } on Exception catch (e) {
            // ignore: avoid_print
            print('Other Exception');
            // ignore: avoid_print
            print('$e');
          }
        },
      ),
    );
  }
}

class EmailTextForm extends ConsumerWidget {
  const EmailTextForm({
    Key? key,
  }) : super(key: key);

  final Color hintTextColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(
              0xE398D759), //==========================================変数で
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            onChanged: (String value) => email.state = value,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'メールアドレス',
              // Extensionを利用予定
              labelStyle: TextStyle(color: hintTextColor),
              hintText: 'Enter your email...',
              // Extensionを利用予定
              hintStyle: TextStyle(color: hintTextColor),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00FFFFFF),
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
              fillColor: const Color(
                  0x00000000), // TODO: ====================================変数で
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
            ),
            style: const TextStyle(
                color: Color.fromARGB(255, 8, 8,
                    8)), // TODO: ====================================変数で
          ),
        ),
      ),
    );
  }
}

class PasswordTextForm extends ConsumerWidget {
  const PasswordTextForm({
    Key? key,
  }) : super(key: key);

  final Color textFromHintText = const Color(0xFF000000);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(passwordProvider.notifier);

    bool passwordVisibility = true;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(
              0xE398D759), //==============================================変数で
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            // 目のアイコンをタップしたらパスワードが見れるように変更
            onChanged: (String value) => password.state = value,
            obscureText: passwordVisibility,
            decoration: InputDecoration(
              labelText: 'パスワード',
              // Extensionを利用予定
              labelStyle: TextStyle(color: textFromHintText),
              hintText: 'Enter your password...',
              // Extensionを利用予定
              hintStyle: TextStyle(color: textFromHintText),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(0, 0, 0, 0), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(0, 255, 255,
                      255), //==============================================変数で
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: const Color(
                  0x00FFFFFF), //==============================================変数で
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
              suffixIcon: InkWell(
                onTap: () => passwordVisibility = !passwordVisibility,
                child: Icon(passwordVisibility
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }
}

class MailAddressLogInButton extends ConsumerWidget {
  MailAddressLogInButton({
    Key? key,
  }) : super(key: key);

  final Color backgroundColor = Colors.blueGrey[700]!;

  final AuthRepo authRepo = AuthRepo();

  final UserControllerBeforeLogin _userControllerBeforeLogin =
      locator.get<UserControllerBeforeLogin>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final infoText = ref.watch(infoTextProvider.notifier);
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);

    return Container(
      width: double.infinity,
      height: 40,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(color: backgroundColor),
        alignment: Alignment.center,
        child: SignInButtonBuilder(
          backgroundColor: backgroundColor,
          icon: Icons.email,
          text: 'Sing in with Email',
          // TODO: lastLoginパラメータの更新処理を追加
          onPressed: () async {
            try {
              final UserCredential userCredential =
                  await authRepo.signInWithEmailAddress(
                email.state,
                password.state,
              );
              if (userCredential.additionalUserInfo!.isNewUser) {
                // TODO: High: IntroductionPageに遷移して、情報登録前にアプリを落とした場合の処理

                _userControllerBeforeLogin.setUserDocument();
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return IntroductionPage();
                    },
                  ),
                );
              } else {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return NavigationPageController();
                    },
                  ),
                );
              }
            } catch (e) {
              infoText.state = "ログインに失敗しました${e.toString()}";
            }
          },
        ),
      ),
    );
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Container(
          width: 250,
          height: 40,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(85, 231, 225,
                    225), //==============================================変数で
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: Colors.black38,
          ),
          alignment: Alignment.center,
          child: InkWell(
            child: const Text('アカウントを新しく作る'),
            onTap: () async {
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const CreateAccountPage();
              }));
            },
          ),
        ),
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 40,
        alignment: Alignment.center,
        child: InkWell(
          child: const Text('パスワードの再設定はこちら'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return const ForgotPassPageWidget();
            }));
          },
        ));
  }
}
