// 性格・趣味・生活
import 'package:flutter/material.dart';

class LifeStyleInfo extends StatelessWidget {
  const LifeStyleInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 309,
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
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 241,
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
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 202,
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
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 163,
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
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 124,
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
                ),
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 85,
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
            top: 234,
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
            top: 195,
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
            top: 156,
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
            top: 117,
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
            top: 78,
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
            top: 39,
            child: SizedBox(
              width: 142,
              height: 29,
              child: Text(
                "性格・タイプ",
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
                  "性格・趣味・生活",
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
