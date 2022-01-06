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
        // 項目２
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
        // 項目３
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
        // 項目４
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
        // 項目５
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
        )
      ],
    );
  }
}
