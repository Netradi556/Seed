// 基本情報
import 'package:flutter/material.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/profile_items_list.dart';

class BasicInfo extends StatelessWidget {
  BasicInfo({
    Key? key,
  }) : super(key: key);

  final List<String> paramName = [
    'ニックネーム',
    '年齢',
    '血液型',
    '話せる言語',
    '居住地',
    '出身地',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 250,
      child: ProfileItemsList(
        itemName: '基本情報',
        itemsList: paramName,
      ),
    );
  }
}

class OldParam extends StatelessWidget {
  const OldParam({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 161,
              height: 29,
              child: Text(
                "栃木",
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
          top: 296,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "東京",
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
          top: 257,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "日本語, 英語",
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
          top: 218,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "いない",
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
          top: 179,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "A型",
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
          top: 140,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "26",
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
          top: 101,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "XXX",
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
      ],
    );
  }
}
