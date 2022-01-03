// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

// PageWidgets
import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';
import 'package:seed_app/ui/bottom_navigation/usr_top.dart';
import 'package:seed_app/ui/introduction.dart';

// Riverpod
import 'package:seed_app/view_model/provider_auth.dart';

/*
  LoginとSing up画面のWidget



*/

/*
  Todo(High)
  サインイン・サインアップのロジック実装
  Forgot passwor画面の実装
  Email&Passwordログインで、パスワードの再入力チェック
  パスワードの強弱チェック、Emailのすでにあるかどうかチェック
  https://firebase.flutter.dev/docs/auth/usage/#registration

  アカウント登録後のチェック画面の実装

  Socialログインの実装
  冗長になっているファイル名の記載を修正
  画像などの差し替え

  Todo(Low)
  タブWidgetの分離

*/

final tabControllerProvider =
    StateProvider.autoDispose((ref) => _tabController);

DefaultTabController? _tabController;

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

// Googleを使ってサインイン
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
  // サインインしたら、UserCredentialを返す
  return FirebaseAuth.instance.signInWithCredential(credential);
}

class AuthPage extends ConsumerWidget {
  final List<TabInfo> _tabs = [
    TabInfo("Sign in", _SignIn()),
    TabInfo("Sign up", _SingUp())
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoText = ref.watch(infoTextProvider.notifier);
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);

    bool passowrdVisibility = true;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 208, 243),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (Image.asset('assets/images/demo.png')).image,
                      fit: BoxFit.fitWidth),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 40),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/demo.png',
                              width: 240,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              const TabBar(
                                tabs: [
                                  Tab(
                                    text: 'Sign In',
                                  ),
                                  Tab(
                                    text: 'Sign up',
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: TabBarView(children: [
                                // Sing inのタブ
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Emailアドレスの入力ボックス
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: TextFormField(
                                        onChanged: (String value) =>
                                            email.state = value,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'メールアドレス',
                                          // Extensionを利用予定
                                          labelStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          hintText: 'Enter your email...',
                                          // Extensionを利用予定
                                          hintStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x98FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                    ),
                                    // パスワードの入力ボックス
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: TextFormField(
                                        onChanged: (String value) =>
                                            password.state = value,
                                        obscureText: passowrdVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'パスワード',
                                          // Extensionを利用予定
                                          labelStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          hintText: 'Enter your email...',
                                          // Extensionを利用予定
                                          hintStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x98FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => passowrdVisibility =
                                                !passowrdVisibility,
                                            child: Icon(passowrdVisibility
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                    ),
                                    // Loginボタン
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: ElevatedButton(
                                        child: const Text('ログイン'),
                                        onPressed: () async {
                                          try {
                                            final FirebaseAuth auth =
                                                FirebaseAuth.instance;
                                            final UserCredential user =
                                                await auth
                                                    .signInWithEmailAndPassword(
                                                        email: email.state,
                                                        password:
                                                            password.state);
                                            await Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return NavigationController();
                                            }));
                                          } catch (e) {
                                            infoText.state =
                                                "ログインに失敗しました${e.toString()}";
                                          }
                                        },
                                      ),
                                    ),
                                    // Forgot Password
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: ElevatedButton(
                                        child: const Text('Forgot Password?'),
                                        onPressed: () async {
                                          try {
                                            await Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return AuthPage();
                                            }));
                                          } catch (e) {
                                            infoText.state =
                                                "パスワード再設定ページは準備中です${e.toString()}";
                                          }
                                        },
                                      ),
                                    ),
                                    // "Social Login"の文字列
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 12, 0, 0),
                                            child: Text(
                                              'Or use a social account to login',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0x98FFFFFF),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Social Loginの一覧
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // FB ログイン実装
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            // FBログイン実装
                                            child: InkWell(
                                              /* nTap: () async {
                                                final user =
                                                    await signInWithFacebook(context);
                                                if (user == null) {
                                                  return;
                                                }
                                                await Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => LoginWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              } */
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFF090F13),
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),

                                                  // FBログイン実装
                                                  child: InkWell(
                                                    /* onTap: () async {
                                                      final user =
                                                          await signInWithFacebook(
                                                              context);
                                                      if (user == null) {
                                                        return;
                                                      }
                                                      await Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginWidget(),
                                                        ),
                                                        (r) => false,
                                                      );
                                                    }, */
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/svg/Twitter - Original.svg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Google ログイン実装
                                          InkWell(
                                            /* onTap: () async {
                                              final user =
                                                  await signInWithGoogle(context);
                                              if (user == null) {
                                                return;
                                              }
                                              await Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => LoginWidget(),
                                                ),
                                                (r) => false,
                                              );
                                            }, */
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFF090F13),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 2, 2, 2),
                                                child: InkWell(
                                                  /*                                         onTap: () async {
                                                    final user =
                                                        await signInWithGoogle(context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    await Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginWidget(),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  }, */
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/svg/Twitter - Original.svg',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Apple ログイン実装
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: InkWell(
                                              // Apple ログイン実装
                                              /*                                     onTap: () async {
                                                final user =
                                                    await signInWithApple(context);
                                                if (user == null) {
                                                  return;
                                                }
                                                await Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => LoginWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              }, */
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFF090F13),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: InkWell(
                                                    /* onTap: () async {
                                                      final user =
                                                          await signInWithApple(context);
                                                      if (user == null) {
                                                        return;
                                                      }
                                                      await Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginWidget(),
                                                        ),
                                                        (r) => false,
                                                      );
                                                    }, */
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/svg/Twitter - Original.svg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Tel ログイン実装
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFF090F13),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 18, 18, 18),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Sing upのタブ
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Emailアドレスの入力ボックス
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: TextFormField(
                                        onChanged: (String value) =>
                                            email.state = value,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'メールアドレス',
                                          // Extensionを利用予定
                                          labelStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          hintText: 'Enter your email...',
                                          // Extensionを利用予定
                                          hintStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x98FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                    ),
                                    // パスワードの入力ボックス
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: TextFormField(
                                        onChanged: (String value) =>
                                            password.state = value,
                                        obscureText: passowrdVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'パスワード',
                                          // Extensionを利用予定
                                          labelStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          hintText: 'Enter your password...',
                                          // Extensionを利用予定
                                          hintStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x98FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => passowrdVisibility =
                                                !passowrdVisibility,
                                            child: Icon(passowrdVisibility
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                    ),
                                    // パスワードの入力ボックス
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: TextFormField(
                                        onChanged: (String value) =>
                                            password.state = value,
                                        obscureText: passowrdVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'パスワード',
                                          // Extensionを利用予定
                                          labelStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          hintText: 'Enter your password...',
                                          // Extensionを利用予定
                                          hintStyle: TextStyle(
                                              color: Colors.amberAccent),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x98FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => passowrdVisibility =
                                                !passowrdVisibility,
                                            child: Icon(passowrdVisibility
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                    ),
                                    // Sign upボタン
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: ElevatedButton(
                                        child: const Text('アカウント作成'),
                                        onPressed: () async {
                                          try {
                                            final FirebaseAuth auth =
                                                FirebaseAuth.instance;
                                            final UserCredential
                                                userCredential =
                                                await FirebaseAuth.instance
                                                    .createUserWithEmailAndPassword(
                                                        email: email.state,
                                                        password:
                                                            password.state);
                                            await Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return IntroductionPage();
                                            }));
                                          } catch (e) {
                                            infoText.state =
                                                "アカウント作成に失敗しました${e.toString()}";
                                          }
                                        },
                                      ),
                                    ),
                                    // Forgot Password
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: ElevatedButton(
                                        child: const Text('Forgot Password?'),
                                        onPressed: () async {
                                          try {
                                            await Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return AuthPage();
                                            }));
                                          } catch (e) {
                                            infoText.state =
                                                "パスワード再設定ページは準備中です${e.toString()}";
                                          }
                                        },
                                      ),
                                    ),
                                    // "Social Login"の文字列
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 12, 0, 0),
                                            child: Text(
                                              'Or use a social account to login',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0x98FFFFFF),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Social Loginの一覧
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
/*                                           // FB ログイン実装
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            // FBログイン実装
                                            child: InkWell(
                                              /* nTap: () async {
                                                final user =
                                                    await signInWithFacebook(context);
                                                if (user == null) {
                                                  return;
                                                }
                                                await Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => LoginWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              } */
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFF090F13),
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),

                                                  // FBログイン実装
                                                  child: InkWell(
                                                    /* onTap: () async {
                                                      final user =
                                                          await signInWithFacebook(
                                                              context);
                                                      if (user == null) {
                                                        return;
                                                      }
                                                      await Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginWidget(),
                                                        ),
                                                        (r) => false,
                                                      );
                                                    }, */
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/svg/Twitter - Original.svg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ), */
                                          // Google ログイン実装
                                          InkWell(
                                            /* onTap: () async {
                                              final user =
                                                  await signInWithGoogle(context);
                                              if (user == null) {
                                                return;
                                              }
                                              await Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => LoginWidget(),
                                                ),
                                                (r) => false,
                                              );
                                            }, */
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFF090F13),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 2, 2, 2),
                                                child: InkWell(
                                                  onTap: () async {
                                                    try {
                                                      final userCredential =
                                                          await signInWithGoogle();
                                                    } on FirebaseAuthException catch (e) {
                                                      print(
                                                          'FirebaseAuthException');
                                                      print('${e.code}');
                                                    } on Exception catch (e) {
                                                      print('Other Exception');
                                                      print('${e.toString()}');
                                                    }
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserTopWidget(),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/svg/Twitter - Original.svg',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          /* // Apple ログイン実装
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: InkWell(
                                              // Apple ログイン実装
                                              /*                                     onTap: () async {
                                                final user =
                                                    await signInWithApple(context);
                                                if (user == null) {
                                                  return;
                                                }
                                                await Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => LoginWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              }, */
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFF090F13),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: InkWell(
                                                    /* onTap: () async {
                                                      final user =
                                                          await signInWithApple(context);
                                                      if (user == null) {
                                                        return;
                                                      }
                                                      await Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginWidget(),
                                                        ),
                                                        (r) => false,
                                                      );
                                                    }, */
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/svg/Twitter - Original.svg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ), */
                                          /* // Tel ログイン実装
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFF090F13),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 18, 18, 18),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ) */
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ])),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SignIn extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoText = ref.watch(infoTextProvider.notifier);
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ロゴ表示領域
              Container(),
              // メールアドレス入力ボックス
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) => email.state = value,
              ),
              // スペーサー
              const SizedBox(
                height: 8,
              ),
              // パスワード入力ボックス
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) => password.state = value,
              ),
              // msg表示領域
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(infoText.state),
              ),
              // ユーザー登録ボタン
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return AuthPage();
                      }));
                    } catch (e) {
                      infoText.state = "ログインに失敗しました${e.toString()}";
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SingUp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column();
  }
}
