import 'package:flutter/material.dart';

// プロフィールスコア
class ProfileScore extends StatelessWidget {
  const ProfileScore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 351,
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
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
            child: const FlutterLogo(size: 25),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
