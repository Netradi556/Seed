// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

// PageWidget

// const

class RegistrationPage2 extends ConsumerWidget {
  const RegistrationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 200,
            ),
            // 学歴の選択欄
            DropdownItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
              itemName: '学歴',
              menuItems: const ['未選択', '大学卒', '高卒'],
            ),
            DropdownItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
              itemName: '職種',
              menuItems: const ['未選択', 'いる', 'いない'],
            ),
            DropdownItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
              itemName: '年収',
              menuItems: const ['未選択', '英語', '中国語', '韓国語'],
            ),
            DropdownItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
              itemName: '身長',
              menuItems: const ['未選択', '東京', '埼玉', '千葉', '神奈川'],
            ),
            DropdownItemsWidget(
              boxWidth: 330,
              boxHeight: 60,
              itemName: '体型',
              menuItems: const ['未選択', '普通', 'ぽっちゃり', '筋肉質', '細身'],
            ),
          ],
        ),
      ),
    );
  }
}

class YearDateItemsWidget extends ConsumerWidget {
  const YearDateItemsWidget({
    Key? key,
    required this.boxWidth,
    required this.boxHeight,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;

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
          IconButton(
            icon: const Icon(FontAwesomeIcons.calendarAlt),
            color: Colors.amber,
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 6),
                initialDatePickerMode: DatePickerMode.year,
              );

              if (selectedDate != null) {
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
      case '学歴':
        return profileEducationProvider;
      case '職種':
        return profileJobProvider;
      case '年収':
        return profileIncomeProvider;
      case '身長':
        return profileHeightProvider;
      case '体型':
        return profileBodyshapeProvider;
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
