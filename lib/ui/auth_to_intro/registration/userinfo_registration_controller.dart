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
String upperImageFilePath = 'assets/images/demo.png';

class RegistrationPageController extends ConsumerWidget {
  final controller = PageController(initialPage: 0);

  final Color backgroundColor = const Color.fromARGB(255, 198, 255, 238);

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
            Container(
              color: const Color.fromARGB(0, 255, 193, 7),
              width: double.infinity,
              height: 30,
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
                    dotColor: Color(
                        0xFF9E9E9E), //===================================変数で
                    activeDotColor: Color.fromARGB(255, 110, 254,
                        129), //===================================変数で
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
