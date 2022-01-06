import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:seed_app/const/constants_profile.dart';

class FormValidator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> aaa = ['a', 'b'];
    return Scaffold(
      body: DropdownItemsWidget(
        menuItems: aaa,
        itemName: 'aaa',
        boxHeight: 20,
        boxWidth: 30,
      ),
    );
  }
}

class DropdownItemsWidget extends ConsumerWidget {
  const DropdownItemsWidget({
    Key? key,
    required this.menuItems,
    required this.itemName,
    required this.boxHeight,
    required this.boxWidth,
  }) : super(key: key);

  final List<String> menuItems;
  final String itemName;
  final int boxWidth;
  final int boxHeight;

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
      width: 300,
      height: 80,
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
