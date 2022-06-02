import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/ui/mypage/mypage.dart';
import 'package:seed_app/view_model/user_controller.dart';
import 'package:seed_app/models/user_models.dart';

// プロフィール画像
class ProfilePictures extends ConsumerWidget {
  ProfilePictures({
    Key? key,
  }) : super(key: key);

  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: InkWell(
        onTap: () async {
          XFile? image =
              await ImagePicker.platform.getImage(source: ImageSource.gallery);
          File xfileToFile = File(image!.path);
          await locator.get<UserController>().uploadProfilePicture(xfileToFile);
        },
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(_currentUser!.avatarUrl), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
