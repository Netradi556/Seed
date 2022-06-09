// Packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/auth_to_intro/registration/userinfo_registration_page1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// PageWidgets
import 'userinfo_registration_page1.dart';
import 'userinfo_registration_page2.dart';
import 'userinfo_registration_page3.dart';

/*
  Todo（High）
  Columnのchildrenに入っているContainer3つをflexを使ってheightの制御をする




*/

// 画像のパス格納用
String upperImagefilePath = 'assets/images/demo.png';

class RegistrationPageController extends ConsumerWidget {
  final controller = PageController(initialPage: 0);

  final Color backgroundColor = const Color.fromARGB(237, 238, 249, 39);

  RegistrationPageController({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                color: Colors.white70,
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const RegistrationPage1(),
                    const RegistrationPage2(),
                    RegistrationPage3(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color(0xFF9EDC68),　//===================================変数で
              child: Align(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (index) {
                    controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 8,
                    radius: 16,
                    dotWidth: 16,
                    dotHeight: 16,
                    dotColor: Color(0xFF9E9E9E), //===================================変数で
                    activeDotColor: Color(0xFF3F51B5),//===================================変数で
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              color: backgroundColor,
            )
          ],
        ),
      ),
    );
  }
}
