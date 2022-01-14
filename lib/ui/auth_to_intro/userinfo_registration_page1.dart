// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod
import 'package:seed_app/view_model/profile_provider.dart';

// PageWidget

// const
import 'package:seed_app/const/constants_profile.dart';

class RegistrationPage1 extends ConsumerWidget {
  const RegistrationPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
        ),
        // 性別の選択欄
        DropdownItemsWidget(
          boxWidth: 330,
          boxHeight: 40,
          itemName: '性別',
          menuItems: ['未選択', '男性', '女性'],
        ),
        // 血液型の選択欄
        DropdownItemsWidget(
          boxWidth: 330,
          boxHeight: 40,
          itemName: '血液型',
          menuItems: ['未選択', 'A', 'B', 'O', 'AB'],
        ),
        // 兄弟姉妹の選択欄
        DropdownItemsWidget(
          boxWidth: 330,
          boxHeight: 40,
          itemName: '兄弟姉妹',
          menuItems: ['未選択', 'いる', 'いない'],
        ),

        // ニックネームの入力欄
        const TextformItemsWidget(
          boxWidth: 330,
          boxHeight: 70,
          itemName: 'ニックネーム',
        )
      ],
    );
  }
}

class DropdownItemsWidget extends ConsumerWidget {
  StateProvider? getProvider(category) {
    switch (category) {
      case '性別':
        return profileSexProvider;
      case '血液型':
        return profileBloodtypeProvider;
      case '兄弟姉妹':
        return profileFamilyProvider;
      case '話せる言語':
        return profileLanguageProvider;
      case '居住地':
        return profileLivingProvider;
      case '出身地':
        return profileBirthplaceProvider;
      default:
        break;
    }
  }

  DropdownItemsWidget({
    Key? key,
    required this.boxWidth,
    required this.boxHeight,
    required this.itemName,
    required this.menuItems,
  }) : super(key: key);

  final String itemName; // 項目名
  final List<String> menuItems; // ドロップダウンのリスト
  final double boxWidth;
  final double boxHeight;
  String _selected = '未選択';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(getProvider(itemName)!.state);
    final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
        .map(
          (String value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();

    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: ListTile(
        title: Text(itemName),
        trailing: DropdownButton(
          value: _selected,
          items: _dropDownMenuItems,
          onChanged: (value) {
            param.state = value as String;
            _selected = param.state; // 画面の再描写のチェック
            print(_selected.toString());
          },
        ),
      ),
    );
  }
}

class TextformItemsWidget extends ConsumerWidget {
  const TextformItemsWidget({
    Key? key,
    required this.itemName,
    required this.boxHeight,
    required this.boxWidth,
  }) : super(key: key);

  final String itemName; // 項目名
  final double boxWidth;
  final double boxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: TextFormField(
        onChanged: (value) {},
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'メールアドレス',
          labelStyle: TextStyle(color: Colors.amberAccent),
          hintText: 'Enter your email...',
          hintStyle: TextStyle(color: Colors.amberAccent),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: const Color(0x98FFFFFF),
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
        ),
        style: const TextStyle(color: Colors.amber),
      ),
    );
  }
}
