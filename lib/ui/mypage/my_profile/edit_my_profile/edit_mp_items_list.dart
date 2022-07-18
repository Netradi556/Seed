import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/provider/profile_provider.dart';

class EditProfileItemsList extends StatelessWidget {
  EditProfileItemsList({
    Key? key,
    required this.categoryName,
    required this.itemsList,
    required this.documentSnapshot,
  }) : super(key: key);

  final Color itemTextColor = const Color.fromARGB(255, 0, 0, 0);

  final String categoryName;
  final List itemsList;
  final Map<String, dynamic> paramItemName = ProfileItemMap().paramItemName;
  final Map<String, List<String>> eachItemToEachParam =
      EachItemToEachParam().eachItemToEachParam;
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          // =====================================================カテゴリ名
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemsList.length, // 作成する項目数＝呼び出し側から受け取った項目数
            itemBuilder: (BuildContext context, index) {
              // 項目名
              final String itemName = paramItemName[itemsList[index]];
              return Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(itemName,
                                style: TextStyle(
                                    color: itemTextColor, fontSize: 16)),
                          ),
                        ),
                        Container(width: 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 160,
                            child: EditItemDropDownWidget(
                              itemNameJP: itemName,
                              itemNameParam: itemsList[index],
                              nowParam: documentSnapshot.get(itemsList[index]),
                              items: eachItemToEachParam[itemsList[index]]!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class EditItemDropDownWidget extends ConsumerWidget {
  EditItemDropDownWidget({
    required this.itemNameJP,
    required this.itemNameParam,
    required this.nowParam,
    required this.items,
    Key? key,
  }) : super(key: key);

  // 選択肢のリスト
  final String itemNameJP;
  final String itemNameParam;
  final String nowParam;
  final List<String> items;
  final selectProvider = StateProvider.autoDispose((ref) => true);

  AutoDisposeStateProvider? getProvider(itemName) {
    switch (itemName) {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DropdownWidget用のProvider
    final isChanged = ref.watch(profileIsChangedAuto.state);
    final selectedState = ref.watch(selectProvider.state);
    final itemParam = ref.watch(getProvider(itemNameJP)!.state);
    final editingContents = ref.watch(profileEditingContents);

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Align(
          alignment: Alignment.center,
          child: Text(nowParam),
        ),
        value: itemParam.state.isEmpty ? null : itemParam.state,
        onChanged: (value) {},
        buttonHeight: 40,
        itemPadding: EdgeInsets.zero,
        // ================================選択されている時の表示内容
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  itemParam.state.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.clip,
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
              child: StatefulBuilder(builder: (context, menuSetState) {
                return InkWell(
                  onTap: () {
                    itemParam.state = item;
                    editingContents[itemNameParam] = itemParam.state;
                    isChanged.state = true;
                    menuSetState(() {});
                    selectedState.state = !selectedState.state;
                    print(itemParam.state.toString());
                    print(editingContents);
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(15, 3, 0, 3),
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ).toList(),
      ),
    );
  }
}
