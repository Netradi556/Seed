// 恋愛・結婚について
import 'package:flutter/material.dart';

class ViewOfLove extends StatelessWidget {
  const ViewOfLove({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 315,
      child: Stack(
        children: const [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 161,
                height: 29,
                child: Text(
                  "割り勘",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.09,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 246,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "気が合えば会いたい",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 206,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "積極的に参加したい",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 166,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "相手と相談して決める",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 126,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "すぐにしたい",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 86,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "なし",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 46,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "独身（未婚）",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.09,
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
                  "初回デート費用",
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
            left: 0,
            top: 241,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "出会うまでの希望",
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
            left: 0,
            top: 202,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "家事・育児",
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
            left: 0,
            top: 163,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "子供がほしいか",
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
            left: 0,
            top: 124,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "結婚に対する意思",
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
            left: 0,
            top: 85,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "子供の有無",
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
            left: 0,
            top: 46,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "結婚歴",
                style: TextStyle(
                  color: Color(0x9e000000),
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 165,
                height: 29,
                child: Text(
                  "恋愛・結婚について",
                  style: TextStyle(
                    color: Color(0xb5000000),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
