// 性格・趣味・生活
import 'package:flutter/material.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/profile_items_list.dart';

class LifeStyleInfo extends StatelessWidget {
  LifeStyleInfo({
    Key? key,
  }) : super(key: key);

  final List<String> paramName = [
    '性格・タイプ',
    '子供の有無',
    '結婚に対する意思',
    '子供がほしいか',
    '家事・育児',
    '出会うまでの希望',
    '初回デート費用',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 309,
      child: ProfileItemsList(
        itemName: '性格・趣味・生活',
        itemsList: paramName,
      ),
    );
  }
}
