import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String imagePath = 'assets/images/logo.jpg';

class UserProfilePageWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 戻るメニュー
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0.34, -1),
                    end: AlignmentDirectional(-0.34, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
              ),
              // プロフ画像
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    ),
                  ),
                  child: Image(
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              // 概要欄
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              // プロフィールスコア
              Container(
                height: 500,
                width: 300,
                color: Colors.amberAccent,
              ),
              // 自由記述欄
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
