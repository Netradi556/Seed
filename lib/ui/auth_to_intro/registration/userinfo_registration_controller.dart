// Packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/auth_to_intro/registration/userinfo_registration_page1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

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

  PageController? pageViewController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firstRegistrationProvider.state);
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
                  children: const [
                    RegistrationPage1(),
                    RegistrationPage2(),
                    RegistrationPage3(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color(0xFF9EDC68),
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
                    dotColor: Color(0xFF9E9E9E),
                    activeDotColor: Color(0xFF3F51B5),
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
