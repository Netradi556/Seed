// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class DropdownItemsWidget1 extends ConsumerWidget {
  const DropdownItemsWidget1({
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
      child: ListTile(
        title: Text(itemName),
        trailing: DropdownButton(
          items: _dropDownMenuItems,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
