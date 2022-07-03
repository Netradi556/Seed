// イントロダクションカード
// ハンドルネーム、バッジ、ステータスコメント、ログイン状況など
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final Color testColor2 = const Color.fromARGB(205, 239, 228, 130);
  final Color badgeIconColor = const Color.fromARGB(173, 31, 134, 40);

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
            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                    child: Text(
                      _currentUser!.handleName
                          .toString(), // =======================ハンドルネームをFSから
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text('25歳', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 30),
                      const Text('東京', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 140),
                      Row(
                        children: [
                          Icon(Icons.how_to_reg, color: badgeIconColor),
                          Icon(Icons.credit_score, color: badgeIconColor),
                          Icon(Icons.fact_check, color: badgeIconColor),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 20,
                      color: Color.fromARGB(255, 221, 207, 81)),
                  Container(
                    width: 350,
                    height: 90,
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: const Text(
                      '休日は外で過ごすことが多いです \n \n ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ), // ==========================SharedPreferencesから
                  ),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 8,
                            height: 25,
                            child: Material(
                              color: Color(0xff60d256),
                              shape: CircleBorder(),
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
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
                          SizedBox(width: 40),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.thumb_up,
                              color: Color.fromARGB(198, 236, 201, 86),
                            ),
                          ),
                          SizedBox(width: 13),
                          SizedBox(
                            width: 75,
                            height: 17,
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

    paint.strokeWidth = 4;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(0, 10), const Offset(0, 210), paint);
    canvas.drawLine(const Offset(30, 240), const Offset(345, 240), paint);

    // 左下
    curveLine.moveTo(0, 210);
    curveLine.quadraticBezierTo(0, 240, 30, 240);
    canvas.drawPath(curveLine, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
