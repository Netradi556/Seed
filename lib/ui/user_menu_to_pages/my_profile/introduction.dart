// 詳細な自己紹介文
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
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
    );
  }
}
