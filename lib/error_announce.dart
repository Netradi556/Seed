import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: const Text(
            'エラーが発生しました'
            '左上の矢印から前の画面に戻ってください。',
          ),
        ),
      ),
    );
  }
}
