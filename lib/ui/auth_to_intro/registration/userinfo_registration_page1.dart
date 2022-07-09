// Packages
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

final selectProvider = StateProvider.autoDispose((ref) => true);
final singleSelectedItemProvider = StateProvider((ref) => '');

class RegistrationPage1 extends ConsumerWidget {
  const RegistrationPage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: SingleChildScrollView(
        child: Container(
          height: 600,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 241, 255, 161),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 200,
                child: Align(
                    alignment: Alignment(0.2, 0.5),
                    child: Text('最初に登録する情報は3つだけです。\n表示名は後から変更できないのでご注意ください。')),
              ),
              // ニックネームの入力欄
              TextFormItemsWidget(),
              const SizedBox(height: 30),
              // 性別の選択欄
              SingleChoiceDropDown(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              ),
              // 生年月日の入力欄
              YearDateItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormItemsWidget extends ConsumerWidget {
  TextFormItemsWidget({
    Key? key,
  }) : super(key: key);

  String defaultParam = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(profileNameProvider.state);

    defaultParam = param.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('ユーザーネーム'),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1.0,
                blurRadius: 20.0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          width: 330,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 80,
              minHeight: 40,
            ),
            child: TextFormField(
              initialValue: defaultParam,
              onChanged: (String value) {
                param.state = value;
                defaultParam = value;
              },
              style: const TextStyle(
                color: Color.fromARGB(196, 55, 54,
                    54), //===============================================変数で
                fontSize: 25,
              ),
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'アプリ内での表示名',
                hintStyle: TextStyle(
                  fontSize: 17,
                ),
                contentPadding: EdgeInsetsDirectional.fromSTEB(15, 3, 10, 0),
              ),
              obscureText: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ],
    );
  }
}

class SingleChoiceDropDown extends ConsumerWidget {
  SingleChoiceDropDown({Key? key}) : super(key: key);

  // 選択肢のリスト
  final List<String> items = [
    '女性',
    '男性',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DropdownWidget用のProvider
    final selectedState = ref.watch(selectProvider.state);
    final selectedSexState = ref.watch(profileSexProvider.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('性別'),
        ),
        DropdownButtonHideUnderline(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1.0,
                  blurRadius: 20.0,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: DropdownButton2(
              isExpanded: true,
              hint: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('未選択'),
                ),
              ),
              value: selectedSexState.state.isEmpty
                  ? null
                  : selectedSexState.state,
              onChanged: (value) {},
              buttonHeight: 40,
              buttonWidth: 330,
              itemPadding: EdgeInsets.zero,
              // 選択されている時の表示内容
              selectedItemBuilder: (context) {
                return items.map(
                  (item) {
                    return Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        // 複数選択されているときはjoinで結合
                        selectedSexState.state.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ).toList();
              },
              items: items.map(
                (item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    enabled: false,
                    child: StatefulBuilder(builder: ((context, menuSetState) {
                      return InkWell(
                        onTap: () {
                          selectedSexState.state = item;
                          menuSetState(() {});
                          selectedState.state = !selectedState.state;
                          print(selectedSexState.state.toString());
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.visible),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class YearDateItemsWidget extends ConsumerWidget {
  YearDateItemsWidget({
    Key? key,
  }) : super(key: key);

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(profileBirthdateProvider.state);
    if (param.state != '') {
      now = DateTime.parse(param.state);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('生年月日'),
        ),
        Container(
          width: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1.0,
                blurRadius: 20.0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                DateFormat('yyyy-MM-dd').format(now).toString(),
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.calendarAlt,
                ),
                iconSize: 35,
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
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
