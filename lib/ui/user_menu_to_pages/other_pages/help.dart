import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  ヘルプやサービス提供に必要なお問い合わせ先などを表示する画面
  静的なコンテンツで構成する



*/

/*
  Todo
  画面デザインの実装

*/
class HelpPageWidget extends ConsumerWidget {
  const HelpPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0.34, -1),
                    end: AlignmentDirectional(-0.34, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const Text('よくあるご質問・ヘルプ'),
                    const Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                color: const Color(0xFFF1F8F7),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
