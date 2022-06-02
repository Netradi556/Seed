// 学歴・職歴・外見
import 'package:flutter/material.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/profile_items_list.dart';

class SocialInfo extends StatelessWidget {
  SocialInfo({
    Key? key,
  }) : super(key: key);

  final List<String> paramName = [
    '学歴',
    '職種',
    '年収',
    '身長',
    '体型',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 231,
      child: ProfileItemsList(
        itemName: '学歴・職種・外見',
        itemsList: paramName,
      ),
    );
  }
}
