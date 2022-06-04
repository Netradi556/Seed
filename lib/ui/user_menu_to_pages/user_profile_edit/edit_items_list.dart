import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/models/profile_item_models.dart';
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

  final ProfileItemDetail detailItem = ProfileItemDetail();

  final Color itemTextColor = const Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
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
                        child: FutureBuilder(
                          future: initialize(itemsList[index]),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return _DropdownItemsWidget(
                                itemName: itemsList[index],
                                menuItems: getList(itemsList[index].toString()),
                                selected: snapshot.data.toString(),
                              );
                            }
                            return Container();
                          },
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
      // 基本情報=============================
      case 'ニックネーム':
        return ['default'];
      case '年齢':
        return ['default'];
      case '血液型':
        return detailItem.bloodType;
      case '話せる言語':
        return detailItem.language;
      case '居住地':
        return detailItem.livingPlace;
      case '出身地':
        return detailItem.birthPlace;

      // 学歴・職歴・外見======================
      case '学歴':
        return detailItem.education;
      case '職種':
        return detailItem.job;
      case '年収':
        return detailItem.income;
      case '身長':
        return detailItem.height;
      case '体型':
        return detailItem.bodyShape;

      // 性格・趣味・生活======================
      case '性格・タイプ':
        return detailItem.personality;
      case '休日':
        return detailItem.offDay;
      case '趣味・好きなこと':
        return detailItem.hobby;
      case '同居している人・ペット':
        return detailItem.livingWith;
      case '喫煙':
        return detailItem.smoke;
      case 'お酒':
        return detailItem.drink;

      // 恋愛・結婚について=====================
      case '子供の有無':
        return detailItem.haveChild;
      case '結婚に対する意思':
        return detailItem.marriageWill;
      case '子供がほしいか':
        return detailItem.wantKids;
      case '家事・育児':
        return detailItem.housework;
      case '出会うまでの希望':
        return detailItem.howMeet;
      case 'デート費用':
        return detailItem.datingCost;
      default:
        return ['default'];
    }
  }
}

Future<String> initialize(String itemName) async {
  String nowParam = 'a';
  try {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    nowParam = pref.getString(itemName)!;
  } catch (e) {
    print(e);
  }
  return nowParam;
}

class _DropdownItemsWidget extends ConsumerWidget {
  StateProvider? getProvider(category) {
    switch (category) {
      // 基本情報=============================
      case 'ニックネーム':
        return profileBloodTypeProvider;
      case '年齢':
        return profileBloodTypeProvider;
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

  _DropdownItemsWidget(
      {Key? key,
      required this.itemName,
      required this.menuItems,
      required this.selected})
      : super(key: key);

  final String itemName; // 項目名
  final List<String> menuItems; // ドロップダウンのリスト
  final double boxWidth = 110;
  final double boxHeight = 50;
  String selected; // = 'default';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(getProvider(itemName)!.state);
    final isChanged = ref.watch(profileIsChanged.state);
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
        isExpanded: true,
        value: selected,
        items: _dropDownMenuItems,
        onChanged: (value) async {
          final SharedPreferences pref = await SharedPreferences.getInstance();

          param.state = value as String;
          isChanged.state = true;
          selected = param.state; // 画面の再描写のチェック

          pref.setString(itemName, param.state);
          print(pref.getString(itemName)! +
              ' 変更あり ' +
              isChanged.state.toString());
        },
      ),
    );
  }
}
