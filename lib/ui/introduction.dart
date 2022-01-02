// only once appear
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPage extends ConsumerWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
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
        },
        next: const Text(
          "Next",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
