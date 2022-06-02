import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
    GekiteniusYogi/Seed/lib/ui/mypage/mypage.dart
    から編集画面に遷移
    遷移時に編集内容を保持するProviderの初期化処理を実装
    　初期化処理：ローカルデータの情報でProviderの値を上書き
    編集確定時には、保持している情報をローカルとFirestoreの両方に書き込み


*/

class UserProfileEditPageWidget extends ConsumerWidget {
  UserProfileEditPageWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw Scaffold(
      body: Container(),
    );
  }
}
