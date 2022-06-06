// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

// PageWidget

// const

class RegistrationPage2 extends ConsumerWidget {
  const RegistrationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(profileSexProvider.state);

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 200,
            child: Align(
              child: Text('''
プロフィールを充実させていくほど
検索されやすくなります
証明書のアップロードでスコアがアップします'''),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(),
            child: InkWell(
              child: Text(param.state),
            ),
          ),
        ],
      ),
    );
  }
}
