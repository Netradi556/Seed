import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget>? Items;

class FormValidator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}

class ItemsWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String btnSelectValue = '';
    throw SizedBox(
      width: 300,
      height: 80, 
      child: 
        Card(
          style: TextStyle(),
          fontsize: 20,
          child: ListTile(
            title: const Text('項目名');
            trailing: DropdownButton<String>(
              value: ,
              onChanged: (String selectValue) {
                btnSelectValue = selectValue;
              },
              items: ,
            );
          ),
      ),
    );
  }
}
