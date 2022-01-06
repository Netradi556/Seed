// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Riverpod

// PageWidgets
import 'userinfo_registration_controller.dart';

/*
  Todo
  各スライドの中断よりやや下部に、Authページへの遷移ボタンを実装
  画像、説明の差し替え

 */

class IntroductionPage extends ConsumerWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        const PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle:
        const PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    titlePadding: const EdgeInsets.all(10),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset('assets/images/demo.png'),
        title: "tutorial page1",
        body: "This page is tutorial No.1",
        footer: const Text(
          "here is footer.",
          style: TextStyle(color: Colors.black),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset('assets/images/demo.png'),
        title: "tutorial page2",
        body: "This page is tutorial No.1",
        footer: const Text(
          "here is footer.",
          style: TextStyle(color: Colors.black),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset('assets/images/demo.png'),
        title: "tutorial page3",
        body: "This page is tutorial No.1",
        footer: const Text(
          "here is footer.",
          style: TextStyle(color: Colors.black),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset('assets/images/demo.png'),
        title: "tutorial page4",
        body: "This page is tutorial No.1",
        footer: const Text(
          "here is footer.",
          style: TextStyle(color: Colors.black),
        ),
        decoration: pageDecoration,
      )
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        done: const Text(
          "Done",
          style: TextStyle(color: Colors.black),
        ),
        onDone: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('haveSeenIntro', true);
          await Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return RegistrationPageController();
          }));
        },
        next: const Text(
          "Next",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
