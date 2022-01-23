import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  feezedを利用してイミュータブルなクラス？でUserオブジェクトを作成して
  Providerを一纏めにするのあり？

*/
final profileNameProvider = StateProvider((ref) => '');
final profileSexProvider = StateProvider((ref) => '');
final profileBirthdateProvider = StateProvider((ref) => '');
final profileBloodtypeProvider = StateProvider((ref) => '');
final profileFamilyProvider = StateProvider((ref) => '');
final profileLanguageProvider = StateProvider((ref) => '');
final profileLivingProvider = StateProvider((ref) => '');
final profileBirthplaceProvider = StateProvider((ref) => '');
