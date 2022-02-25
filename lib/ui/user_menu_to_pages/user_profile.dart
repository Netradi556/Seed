import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String imagePath = 'assets/images/user1.jpg';

class UserProfilePageWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 戻るメニュー
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0.34, -1),
                    end: AlignmentDirectional(-0.34, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
              ),
              // プロフ画像
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    ),
                  ),
                  child: Image(
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              // 概要欄
              Container(
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
                            color: Color(0x7FD4D6D8),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
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
                                  SizedBox(
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
                                  SizedBox(height: 21),
                                  SizedBox(
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
                                  SizedBox(height: 21),
                                  Container(
                                    width: 250,
                                    height: 25,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 8,
                                          height: 25,
                                          child: Material(
                                            color: Color(0xff60d256),
                                            shape: CircleBorder(),
                                          ),
                                        ),
                                        SizedBox(width: 16.33),
                                        SizedBox(
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
                                        SizedBox(width: 15),
                                        Container(
                                          width: 19,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xfff9be65),
                                              width: 1,
                                            ),
                                          ),
                                          child: FlutterLogo(size: 12),
                                        ),
                                        SizedBox(width: 16.33),
                                        SizedBox(
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
                    Positioned.fill(
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
                      child: Container(
                        width: 179,
                        height: 19,
                        child: Stack(
                          children: [
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
              ),
              // プロフィールスコア
              Container(
                width: 351,
                height: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 351,
                      height: 45,
                      child: Text(
                        "プロフィールスコア",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FlutterLogo(size: 25),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              // 自由記述欄
              Container(
                width: 400,
                height: 711,
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 356,
                      height: 667,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Color(0xfffabf66),
                          width: 2,
                        ),
                        color: Color(0x28f9be65),
                      ),
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 10,
                        top: 23,
                        bottom: 17,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 330,
                            height: 667,
                            child: Text(
                              "pairs初心者です。\n今は実家暮らしですが、元々学生時代から10年位は1人暮らしをしていましたので最低限の生活スキルはあると思います。\n\n気取らず、自然体でいられる、お互いの価値観や人間関係を尊重できる、そんな関係性がいいなと思っています。\n\n元々インドア派ですがこの１年くらいでブームに乗っかって始めたキャンプにハマっております。\n仕事は不定休なので連休があればキャンプ、単発の休みはYouTubeやAmazonプライム、Netflix観てダラダラ過ごすことが多いです。\n\n温泉と漫画も好きなので温泉施設行ってフリースペースで漫画一気読みとかもします。\n\nお酒は強いわけではないですが飲むのは好きです。\nコロナ禍で今は難しいですが安くて美味しい居酒屋さんとかを開拓していける世の中にまたなって欲しいです。",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
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
              Container(
                width: 356,
                height: 358,
                child: Stack(
                  children: [
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
                ),
              ),
              Container(
                width: 356,
                height: 231,
                child: Stack(
                  children: [
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
                ),
              ),
              // プロフパラメータ
              Container(
                width: 356,
                height: 309,
                child: Stack(
                  children: [
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
              ),
              Container(
                width: 356,
                height: 315,
                child: Stack(
                  children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
