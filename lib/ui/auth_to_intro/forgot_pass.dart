import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod
import 'package:seed_app/view_model/auth_provider.dart';

String _backgroundImagePath = 'assets/images/logo.jpg';

class ForgotPassPageWidget extends ConsumerWidget {
  const ForgotPassPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_rounded,
            size: 32,
          ),
        ),
        title: const Text(
          'パスワードの再設定',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                image: Image.asset(_backgroundImagePath).image,
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // メールアドレスの入力フォーム
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: TextFormField(
                onChanged: (String value) => email.state = value,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'メールアドレス',
                  // Extensionを利用予定
                  labelStyle: const TextStyle(color: Colors.amberAccent),
                  hintText: 'Enter your email...',
                  // Extensionを利用予定
                  hintStyle: const TextStyle(color: Colors.amberAccent),
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
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: const TextStyle(color: Colors.amber),
              ),
            ),
            // リセットボタン
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (email.state.toString().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'メールアドレスを入力してください',
                          ),
                        ),
                      );
                      return;
                    }
                    /* resetPassword(
                    email: emailAddressController.text,
                    context: context,
                  ); */
                    Navigator.pop(context);
                  },
                  child: const Text('Send Reset Link'),
                  style: const ButtonStyle(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
