import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザー情報の受け渡しを行うためのProvicer
final userProvider = StateProvider.autoDispose((ref) {
  return FirebaseAuth.instance.currentUser;
});

// エラー情報の受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final infoTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// メールアドレスの受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final emailProvider = StateProvider.autoDispose((ref) => '');

// パスワードの受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

// メッセージの受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final messageTextProvider = StateProvider.autoDispose((ref) {
  return '';
});
