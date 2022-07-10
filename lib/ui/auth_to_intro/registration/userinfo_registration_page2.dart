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
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 40),
      child: Container(
        height: 600,
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 241, 255, 161),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 10.0,
              offset: Offset(10, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
              child: Align(
                child: Text('''
プロフィールを充実させていくほど
検索されやすくなります
証明書のアップロードでスコアがアップします'''),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: InkWell(
                child: Text(param.state),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
