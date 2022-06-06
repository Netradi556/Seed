// Package

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            const AuthFootpadsPaddingWidget(),
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: () async {
          try {
            final UserCredential userCredential =
                await authRepo.signInWithGoogle();

            if (userCredential.additionalUserInfo!.isNewUser) {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => IntroductionPage(),
                ),
                (r) => false,
              );
            } else {
              locator.get<UserController>().initializeLocalProfilePicturePath();
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
            print(e.code);
          } on Exception catch (e) {
            print('Other Exception');
            print('$e');
          }
        },
        child: const Text('Google Sign in'),
        style: const ButtonStyle(),
      ),
    );
  }
}

class EmailTextForm extends ConsumerWidget {
  const EmailTextForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xE398D759),
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
              labelStyle: const TextStyle(color: Color(0xFF000000)),
              hintText: 'Enter your email...',
              // Extensionを利用予定
              hintStyle: const TextStyle(color: Color(0xFF000000)),
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
              fillColor: const Color(0x00000000),
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
            ),
            style: const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
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
          color: const Color(0xE398D759),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            onChanged: (String value) => password.state = value,
            obscureText: passwordVisibility,
            decoration: InputDecoration(
              labelText: 'パスワード',
              // Extensionを利用予定
              labelStyle: const TextStyle(color: Color(0xFF000000)),
              hintText: 'Enter your password...',
              // Extensionを利用予定
              hintStyle: const TextStyle(color: Color(0xFF000000)),
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
              fillColor: const Color(0x00FFFFFF),
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

  final Color backgroundColor = const Color.fromARGB(250, 127, 249, 45);

  final AuthRepo authRepo = AuthRepo();

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
        width: 150,
        height: 40,
        decoration: BoxDecoration(color: backgroundColor),
        alignment: Alignment.center,
        child: InkWell(
          child: const Text('ログイン'),
          onTap: () async {
            print(password.state.toString());
            try {
              final UserCredential userCredential =
                  await authRepo.signInWithEmailAddress(
                email.state,
                password.state,
              );
              if (userCredential.additionalUserInfo!.isNewUser) {
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
                color: Color.fromARGB(85, 231, 225, 225),
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

class AuthFootpadsPaddingWidget extends StatelessWidget {
  const AuthFootpadsPaddingWidget({
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
