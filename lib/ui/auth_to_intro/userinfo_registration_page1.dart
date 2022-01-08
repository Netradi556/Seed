// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod
import 'package:seed_app/view_model/profile_provider.dart';

// PageWidget

// const
import 'package:seed_app/const/constants_profile.dart';

class RegistrationPage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sex = ref.watch(profileSexProvider.notifier);
    final age = ref.watch(profileAgeProvider.notifier);
    return Container(
      child: Column(
        children: [
          DropdownItemsWidget(
            boxWidth: 300,
            boxHeight: 70,
            itemName: '住所',
            menuItems: prefectrure.toList(),
          ),
          DropdownItemsWidget(
            boxWidth: 300,
            boxHeight: 70,
            itemName: '性別',
            menuItems: const ['男性', '女性'],
          ),
          const TextformItemsWidget(
            boxWidth: 200,
            boxHeight: 70,
            itemName: 'ニックネーム',
          )
        ],
      ),
    );
  }
}

class DropdownItemsWidget extends ConsumerWidget {
  StateProvider? getProvider(category) {
    switch (category) {
      case '性別':
        return profileSexProvider;
      case '年齢':
        return profileAgeProvider;
      default:
        break;
    }
  }

  DropdownItemsWidget({
    Key? key,
    required this.menuItems,
    required this.itemName,
    required this.boxHeight,
    required this.boxWidth,
  }) : super(key: key);

  final String itemName; // 項目名
  final List<String> menuItems; // ドロップダウンのリスト
  final double boxWidth;
  final double boxHeight;
  String selectItem = '未選択';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(getProvider(itemName)!).state;

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
          value: _dropDownMenuItems[0].value,
          items: _dropDownMenuItems,
          onChanged: (value) {
            param.state = value as String;
          }, // 未実装
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
