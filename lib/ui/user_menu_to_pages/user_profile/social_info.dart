// 学歴・職歴・外見
import 'package:flutter/material.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/profile_items_list.dart';

class SocialInfo extends StatelessWidget {
  SocialInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 231,
      child: OldParam(),
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
                "ふつう",
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
          top: 163,
          child: SizedBox(
            width: 161,
            height: 29,
            child: Text(
              "153cm",
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
              "400万円〜500万円",
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
              "事務",
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
              "大学卒",
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
                "体型",
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
          top: 163,
          child: SizedBox(
            width: 142,
            height: 29,
            child: Text(
              "身長",
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
              "年収",
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
              "職種",
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
              "学歴",
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
                "学歴・職種・外見",
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
    );
  }
}
