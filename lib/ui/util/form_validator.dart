import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  状態管理をちゃんと理解していないせいか、importで使えません。

*/

class DropdownItemsWidget extends ConsumerWidget {
  const DropdownItemsWidget({
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
        .map(
          (String value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();

    return Column(
      children: [
        // 項目１
        SizedBox(
          width: boxWidth,
          height: boxHeight,
          child: ListTile(
            title: Text(itemName),
            trailing: DropdownButton(
              items: _dropDownMenuItems,
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}

class TextformItemsWidget extends ConsumerWidget {
  const TextformItemsWidget({
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      child: TextFormField(
        onChanged: (value) {},
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'メールアドレス',
          labelStyle: const TextStyle(color: Colors.amberAccent),
          hintText: 'Enter your email...',
          hintStyle: const TextStyle(color: Colors.amberAccent),
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
          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
        ),
        style: const TextStyle(color: Colors.amber),
      ),
    );
  }
}
