// 詳細な自己紹介文
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyIntroduction extends StatelessWidget {
  const MyIntroduction({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  final DocumentSnapshot documentSnapshot;
  final String aaa =
      "アプリ初めたばかりです。\n今は実家暮らしですが、元々学生時代から10年位は1人暮らしをしていましたので最低限の生活スキルはあると思います。\n\n気取らず、自然体でいられる、お互いの価値観や人間関係を尊重できる、そんな関係性がいいなと思っています。\n\n元々インドア派ですがこの１年くらいでブームに乗っかって始めたキャンプにハマっております。\n仕事は不定休なので連休があればキャンプ、単発の休みはYouTubeやAmazonプライム、Netflix観てダラダラ過ごすことが多いです。\n\n温泉と漫画も好きなので温泉施設行ってフリースペースで漫画一気読みとかもします。\n\nお酒は強いわけではないですが飲むのは好きです。\nコロナ禍で今は難しいですが安くて美味しい居酒屋さんとかを開拓していける世の中にまたなって欲しいです。";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: const Color(0xfffabf66),
            width: 2,
          ),
          color: const Color(0x28f9be65),
        ),
        padding: const EdgeInsets.only(
          left: 12,
          right: 10,
          top: 23,
          bottom: 17,
        ),
        child: Text(
          documentSnapshot.get('about'),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
