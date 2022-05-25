import 'package:flutter/material.dart';

String imagePath = 'assets/images/user1.jpg';

// プロフィール画像
class ProfilePictures extends StatelessWidget {
  const ProfilePictures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
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
    );
  }
}
