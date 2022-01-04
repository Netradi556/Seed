import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String _backgroundImagePath = '';
String _logoImagePath = '';

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
                AuthTextPaddingWidget(),
                // アカウント作成のボタン
                AuthFoggotpassPaddingWidget(),
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

class AuthEmailboxPaddingWidget extends StatelessWidget {
  const AuthEmailboxPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            controller: emailTextController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Email Address',
              labelStyle: FlutterFlowTheme.bodyText1,
              hintText: 'Email Address',
              hintStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
            ),
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.tertiaryColor,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}

class AuthPassboxPaddingWidget extends StatelessWidget {
  const AuthPassboxPaddingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.background,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
          child: TextFormField(
            controller: passwordTextController,
            obscureText: !passwordVisibility,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: FlutterFlowTheme.bodyText1,
              hintText: 'Password',
              hintStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              suffixIcon: InkWell(
                onTap: () => setState(
                  () => passwordVisibility = !passwordVisibility,
                ),
                child: Icon(
                  passwordVisibility
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: FlutterFlowTheme.grayDark,
                  size: 24,
                ),
              ),
            ),
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.tertiaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

class AuthLoginEbuttonWidget extends StatelessWidget {
  const AuthLoginEbuttonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final user = await signInWithEmail(
          context,
          emailTextController.text,
          passwordTextController.text,
        );
        if (user == null) {
          return;
        }

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavBarPage(initialPage: 'chatMain'),
          ),
        );
      },
      text: 'Log In',
      options: FFButtonOptions(
        width: 300,
        height: 55,
        color: FlutterFlowTheme.primaryColor,
        textStyle: FlutterFlowTheme.subtitle2,
        elevation: 4,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 2,
        ),
        borderRadius: 30,
      ),
    );
  }
}

class AuthTextPaddingWidget extends StatelessWidget {
  const AuthTextPaddingWidget({
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Text(
              'Don\'t have an account?',
              style: FlutterFlowTheme.bodyText1,
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 150),
                  reverseDuration: Duration(milliseconds: 150),
                  child: RegisterWidget(),
                ),
              );
            },
            text: 'Create Account',
            options: FFButtonOptions(
              width: 140,
              height: 40,
              color: Color(0x004B39EF),
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
              ),
              elevation: 0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: 12,
            ),
          ),
        ],
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
      child: FFButtonWidget(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForgotPasswordWidget(),
            ),
          );
        },
        text: 'Forgot Password?',
        options: FFButtonOptions(
          width: 200,
          height: 55,
          color: FlutterFlowTheme.dark900,
          textStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.tertiaryColor,
          ),
          elevation: 0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: 30,
        ),
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
      child: FFButtonWidget(
        onPressed: () async {
          final user = await signInAnonymously(context);
          if (user == null) {
            return;
          }
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 250),
              reverseDuration: Duration(milliseconds: 250),
              child: MyFriendsWidget(),
            ),
          );
        },
        text: 'Continue as Guest',
        options: FFButtonOptions(
          width: 200,
          height: 55,
          color: FlutterFlowTheme.background,
          textStyle: FlutterFlowTheme.subtitle2,
          elevation: 4,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: 30,
        ),
      ),
    );
  }
}
