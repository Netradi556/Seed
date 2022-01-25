// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Riverpod
import 'package:seed_app/view_model/profile_provider.dart';

// PageWidget

// const
import 'package:seed_app/const/constants_profile.dart';

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
              menuItems: ['未選択', '男性', '女性'],
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
