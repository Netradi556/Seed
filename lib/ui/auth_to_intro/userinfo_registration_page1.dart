// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// Riverpod
import 'package:seed_app/view_model/profile_provider.dart';

// PageWidget

// const

class RegistrationPage1 extends ConsumerWidget {
  const RegistrationPage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(),
              child: const Align(
                  alignment: Alignment(0.2, 0.5),
                  child: Text('最初に登録する情報は3つだけです！')),
            ),
            // ニックネームの入力欄
            const TextformItemsWidget(
              boxWidth: 330,
              boxHeight: 100,
              itemName: 'ニックネーム',
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            // 性別の選択欄
            DropdownItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
              itemName: '性別',
              menuItems: const ['未選択', '男性', '女性'],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            ),
            // 生年月日の入力欄
            YearDateItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class YearDateItemsWidget extends ConsumerWidget {
  YearDateItemsWidget({
    Key? key,
    required this.boxWidth,
    required this.boxHeight,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;
  var now = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(profileBirthdateProvider.state);
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('生年月日'),
          // DateFormat.yMMMMEEEEd('ja').format(now).toString()
          // param.state.toString()
          Text(DateFormat('yyyy-MM-dd').format(now).toString()),
          IconButton(
            icon: const Icon(FontAwesomeIcons.calendarAlt),
            color: Colors.amber,
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDatePickerMode: DatePickerMode.year, // 最初に年から入力
                initialDate: DateTime(DateTime.now().year - 22),
                firstDate: DateTime(
                  DateTime.now().year - 100,
                  DateTime.now().month,
                  DateTime.now().day,
                ), // 選択可能な最も古い日付
                lastDate: DateTime(
                  DateTime.now().year - 20,
                  DateTime.now().month,
                  DateTime.now().day,
                ), // 選択可能な最も新しい日付
              );

              if (selectedDate != null) {
                now = selectedDate;
                param.state = selectedDate.toString();
                // do something
              }
            },
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
      default:
        break;
    }
    return null;
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
    final param1 = ref.watch(firstRegistrationProvider.state);
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
      child: Column(
        children: [
          ListTile(
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
        ],
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
    final param = ref.watch(profileNameProvider.state);
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ニックネーム'),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 70,
              minHeight: 40,
            ),
            child: TextFormField(
              onChanged: (String value) => param.state = value,
              obscureText: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: 10,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0x98D4D5D8),
                contentPadding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              ),
              style: const TextStyle(color: Color(0xC4000000)),
            ),
          ),
        ],
      ),
    );
  }
}
