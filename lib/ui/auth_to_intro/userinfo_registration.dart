// Packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Provider
import 'package:seed_app/view_model/util_provider.dart';
import 'package:seed_app/view_model/auth_provider.dart';
import 'package:seed_app/ui/bottom_navigation/navigtion_controller.dart';

// PageWidgets
import 'auth.dart';
import 'introduction.dart';

// 画像のパス格納用
String upperImagefilePath = 'assets/images/demo.png';

class RegistrationPageController extends ConsumerWidget {
  final controller = PageController(initialPage: 1);

  PageController? pageViewController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              height: 500,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: PageView(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      children: [
                        RegistrationPage1(),
                        RegistrationPage2(),
                        RegistrationPage3(),
                        RegistrationPage4(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
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
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class RegistrationPage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        width: 356,
        height: 358,
        child: Stack(
          children: [
            Positioned(
              left: 235,
              top: 101,
              child: Container(
                width: 121,
                height: 29,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 121,
                      height: 29,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0x51000000),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 96,
                            right: 18,
                            top: 12,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.80,
                                child: SizedBox(
                                  width: 8.40,
                                  height: 4.10,
                                  child: Material(
                                    color: Color(0x7f7f3a44),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.399999976158142,
                                        color: Color(0x51000000),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 147,
              child: Container(
                width: 121,
                height: 29,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 121,
                      height: 29,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0x51000000),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 96,
                            right: 18,
                            top: 12,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.80,
                                child: SizedBox(
                                  width: 8.40,
                                  height: 4.10,
                                  child: Material(
                                    color: Color(0x7f7f3a44),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.399999976158142,
                                        color: Color(0x51000000),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 193,
              child: Container(
                width: 121,
                height: 29,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 121,
                      height: 29,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0x51000000),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 96,
                            right: 18,
                            top: 12,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.80,
                                child: SizedBox(
                                  width: 8.40,
                                  height: 4.10,
                                  child: Material(
                                    color: Color(0x7f7f3a44),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.399999976158142,
                                        color: Color(0x51000000),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 239,
              child: Container(
                width: 121,
                height: 29,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 121,
                      height: 29,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0x51000000),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 96,
                            right: 18,
                            top: 12,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.80,
                                child: SizedBox(
                                  width: 8.40,
                                  height: 4.10,
                                  child: Material(
                                    color: Color(0x7f7f3a44),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.399999976158142,
                                        color: Color(0x51000000),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 285,
              child: Container(
                width: 121,
                height: 29,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 121,
                      height: 29,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0x51000000),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 96,
                            right: 18,
                            top: 12,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.80,
                                child: SizedBox(
                                  width: 8.40,
                                  height: 4.10,
                                  child: Material(
                                    color: Color(0x7f7f3a44),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.399999976158142,
                                        color: Color(0x51000000),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 121,
                  height: 29,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 121,
                        height: 29,
                        child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.5,
                              color: Color(0x51000000),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 96,
                              right: 18,
                              top: 12,
                              bottom: 15,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Opacity(
                                  opacity: 0.80,
                                  child: SizedBox(
                                    width: 8.40,
                                    height: 4.10,
                                    child: Material(
                                      color: Color(0x7f7f3a44),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.399999976158142,
                                          color: Color(0x51000000),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 142,
                  height: 29,
                  child: Text(
                    "出身地",
                    style: TextStyle(
                      color: Color(0x9e000000),
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 296,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "居住地",
                  style: TextStyle(
                    color: Color(0x9e000000),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 257,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "話せる言語",
                  style: TextStyle(
                    color: Color(0x9e000000),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 218,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "兄弟姉妹",
                  style: TextStyle(
                    color: Color(0x9e000000),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 179,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "血液型",
                  style: TextStyle(
                    color: Color(0x9e000000),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 140,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "年齢",
                  style: TextStyle(
                    color: Color(0x9e000000),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 101,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "ニックネーム",
                  style: TextStyle(
                    color: Color(0x9e000000),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              top: 55,
              child: SizedBox(
                width: 142,
                height: 29,
                child: Text(
                  "基本情報",
                  style: TextStyle(
                    color: Color(0xb5000000),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 175,
                  height: 39,
                  child: Text(
                    "プロフィール",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 97,
              top: 104,
              child: SizedBox(
                width: 14,
                height: 9,
                child: Text(
                  "※",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffff0000),
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.red,
        ),
        Container(),
        Container()
      ],
    );
  }
}

class RegistrationPage3 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}

class RegistrationPage4 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}
