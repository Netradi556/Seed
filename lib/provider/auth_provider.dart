import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザー情報の受け渡しを行うためのProvicer
final userProvider =
    StateProvider.autoDispose((ref) => FirebaseAuth.instance.currentUser);

// エラー情報の受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final infoTextProvider = StateProvider.autoDispose((ref) => '');

// メールアドレスの受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final emailProvider = StateProvider.autoDispose((ref) => '');

// パスワードの受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final passwordProvider = StateProvider.autoDispose((ref) => '');

// メッセージの受け渡しを行うためのProvider
// ※ autoDisposeをつけることで自動的に値をリセットできます
final messageTextProvider = StateProvider.autoDispose((ref) => '');
