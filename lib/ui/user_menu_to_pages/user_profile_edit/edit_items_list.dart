import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileItemsList extends StatelessWidget {
  EditProfileItemsList({
    Key? key,
    required this.itemName,
    required this.itemsList,
  }) : super(key: key);

  final double width = 350;

  final String itemName;
  final List<String> itemsList;

  final Color itemTextColor = const Color.fromARGB(255, 0, 0, 0);

  final List<String> bloodType = ['A', 'B', 'O', 'AB'];

  @override
  Widget build(BuildContext context) {
    String someText = 'testMessage';

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              itemName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemsList.length,
            itemBuilder: (BuildContext context, index) {
              return SizedBox(
                width: 80,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(itemsList[index].toString(),
                            style: TextStyle(
                              color: itemTextColor,
                              fontSize: 16,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        // itemsList[index]の情報をもとにローカルから値を取得----------------------
                        child: _DropdownItemsWidget(
                          itemName: '話せる言語',
                          menuItems: getList('話せる言語'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<String> getList(itemName) {
    switch (itemName) {
      case '血液型':
        return ['A', 'B', 'O', 'AB', 'default'];
      case '話せる言語':
        return ['日本語', '英語', '中国語', 'それ以外', 'default'];
      case '居住地':
        return ['東京', '千葉', '埼玉', '横浜', 'default'];
      case '出身地':
        return ['北海道', '沖縄', 'default'];
      default:
        return ['default'];
    }
  }
}

class _DropdownItemsWidget extends ConsumerWidget {
  StateProvider? getProvider(category) {
    switch (category) {
      // 基本情報=============================
      case '血液型':
        return profileBloodTypeProvider;
      case '話せる言語':
        return profileLanguageProvider;
      case '居住地':
        return profileLivingPlaceProvider;
      case '出身地':
        return profileBirthPlaceProvider;

      // 学歴・職歴・外見======================
      case '学歴':
        return profileEducationProvider;
      case '職種':
        return profileJobProvider;
      case '年収':
        return profileIncomeProvider;
      case '身長':
        return profileHeightProvider;
      case '体型':
        return profileBodyShapeProvider;

      // 性格・趣味・生活======================
      case '性格・タイプ':
        return profilePersonalityProvider;
      case '休日':
        return profileOffDayProvider;
      case '趣味・好きなこと':
        return profileHobbyProvider;
      case '同居している人・ペット':
        return profileLivingWithProvider;
      case '喫煙':
        return profileSmokeProvider;
      case 'お酒':
        return profileDrinkProvider;

      // 恋愛・結婚について=====================
      case '子供の有無':
        return profileHaveChildProvider;
      case '結婚に対する意思':
        return profileMarriageWillProvider;
      case '子供がほしいか':
        return profileWantKidsProvider;
      case '家事・育児':
        return profileHouseworkProvider;
      case '出会うまでの希望':
        return profileHowMeetProvider;
      case 'デート費用':
        return profileDatingCostProvider;

      default:
        break;
    }
    return null;
  }

  _DropdownItemsWidget({
    Key? key,
    required this.itemName,
    required this.menuItems,
  }) : super(key: key);

  final String itemName; // 項目名
  final List<String> menuItems; // ドロップダウンのリスト
  final double boxWidth = 100;
  final double boxHeight = 50;
  String _selected = 'default';

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
      child: DropdownButton(
        value: _selected,
        items: _dropDownMenuItems,
        onChanged: (value) {
          param.state = value as String;
          _selected = param.state; // 画面の再描写のチェック
          print(_selected.toString());
          print(param.hashCode.toString());
        },
      ),
    );
  }
}
