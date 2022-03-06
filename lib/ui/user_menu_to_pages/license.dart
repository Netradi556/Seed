import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/const/constants_terms.dart';

class LicensePageWidget extends ConsumerWidget {
  const LicensePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // 戻るボタン・画面名
            Expanded(
              flex: 7,
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
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                    Text('会員ステータス'),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            // 画面内コンテンツ
            Expanded(
              flex: 100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 余白
                    const SizedBox(
                      height: 20,
                    ),
                    // 会員ステータスの枠
                    SizedBox(
                      width: 350,
                      height: 160,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xffffaf14),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    // 余白
                    const SizedBox(
                      height: 20,
                    ),
                    // プライベートモードの設定
                    SizedBox(
                      width: 350,
                      height: 160,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xffffaf14),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    // 余白
                    const SizedBox(
                      height: 20,
                    ),
                    // 次回更新について
                    const SizedBox(
                      width: 353,
                      height: 370,
                      child: Text(
                        nextSubscriptionUpdate,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // 余白
                    const SizedBox(
                      height: 20,
                    ),
                    // 次回いいね付与日・付与数
                    SizedBox(
                      width: 350,
                      height: 60,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '次回いいね！付与日',
                              ),
                              Text('2022/05/20')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '次回いいね！付与数',
                              ),
                              Text('30いいね！')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 353,
                      height: 100,
                      child: Text(
                        difference,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
