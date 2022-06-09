import 'package:flutter/material.dart';

/*
  メールアドレスとパスワードを入力
  メールアドレス宛に届いた認証リンクをクリックすると画面遷移
  　→Providerで状態管理する必要あり？
  　→それともトランザクションを貼って、処理が終了したら画面遷移？

  登録完了画面でボタンを表示
  初回登録の画面に遷移


*/

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
