// イントロダクションカード
// ハンドルネーム、バッジ、ステータスコメント、ログイン状況など
import 'package:flutter/material.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _IntroductionCard(),
        const SizedBox(height: 30),
      ],
    );
  }
}

class _IntroductionCard extends StatelessWidget {
  _IntroductionCard({Key? key}) : super(key: key);

  final Color borderColor = const Color(0xFFFABF66);
  final Color testColor1 = const Color.fromARGB(94, 102, 104, 250);
  final Color testColor2 = const Color.fromARGB(94, 235, 87, 64);

  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 250,
      child: Stack(
        children: [
          CustomPaint(
            painter: _CurveLineUi(
              borderColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
            child: Container(
              width: 350,
              height: 240,
              color: testColor1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_currentUser!.handleName.toString(),
                      style: const TextStyle(fontSize: 25)),
                  const Divider(),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      const Text('25歳', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 15),
                      const Text('東京', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 80),
                      Row(
                        children: const [
                          Icon(Icons.abc),
                          Icon(Icons.ac_unit),
                          Icon(Icons.add_box),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 350,
                    height: 110,
                    child: const Text(
                        'introduction'), // ==========================SharedPreferencesから
                    color: testColor2,
                  ),
                  SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 8,
                            height: 25,
                            child: Material(
                              color: Color(0xff60d256),
                              shape: CircleBorder(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const SizedBox(
                            width: 69,
                            height: 20,
                            child: Text(
                              "1時間以内",
                              style: TextStyle(
                                color: Color(0x7f000000),
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xfff9be65),
                                width: 1,
                              ),
                            ),
                            child: const FlutterLogo(size: 12),
                          ),
                          const SizedBox(width: 10),
                          const SizedBox(
                            width: 75,
                            height: 20,
                            child: Text(
                              "25いいね！",
                              style: TextStyle(
                                color: Color(0x7f000000),
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurveLineUi extends CustomPainter {
  final Color borderColor;

  _CurveLineUi(this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = borderColor;
    final curveLine = Path();

    paint.strokeWidth = 5;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(0, 10), const Offset(0, 220), paint);
    canvas.drawLine(const Offset(30, 250), const Offset(345, 250), paint);

    // 左下
    curveLine.moveTo(0, 220);
    curveLine.quadraticBezierTo(0, 250, 30, 250);
    canvas.drawPath(curveLine, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
