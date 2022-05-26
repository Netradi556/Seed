// イントロダクションカード
// ハンドルネーム、バッジ、ステータスコメント、ログイン状況など
import 'package:flutter/material.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 381,
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 369,
                height: 220,
                child: Material(
                  color: const Color(0x7FD4D6D8),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 4,
                      color: Color(0xbcfabe66),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 15,
                      top: 40,
                      bottom: 19,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 107,
                          height: 22,
                          child: Text(
                            "25歳　東京",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 21),
                        const SizedBox(
                          width: 350,
                          height: 56,
                          child: Text(
                            "カフェ、ディズニー、Kpop、邦ロック、写真...",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 21),
                        SizedBox(
                          width: 250,
                          height: 25,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 8,
                                height: 25,
                                child: Material(
                                  color: Color(0xff60d256),
                                  shape: CircleBorder(),
                                ),
                              ),
                              const SizedBox(width: 16.33),
                              const SizedBox(
                                width: 69,
                                height: 25,
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
                              const SizedBox(width: 15),
                              Container(
                                width: 19,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xfff9be65),
                                    width: 1,
                                  ),
                                ),
                                child: const FlutterLogo(size: 12),
                              ),
                              const SizedBox(width: 16.33),
                              const SizedBox(
                                width: 75,
                                height: 25,
                                child: Text(
                                  "25いいね！",
                                  style: TextStyle(
                                    color: Color(0x7f000000),
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 359.50,
                height: 45,
                child: Text(
                  "かえで",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 198,
            top: 46,
            child: SizedBox(
              width: 179,
              height: 19,
              child: Stack(
                children: const [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 179,
                        height: 17,
                        child: Material(
                          color: Color(0x23FFFFFF),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 138.49,
                        height: 17,
                        child: Text(
                          "バッジアイコン",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
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
