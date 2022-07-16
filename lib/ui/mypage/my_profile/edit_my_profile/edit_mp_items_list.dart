import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/provider/profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewEditProfileItemsList extends StatelessWidget {
  NewEditProfileItemsList({
    Key? key,
    required this.categoryName,
    required this.itemsList,
  }) : super(key: key);

  final Color itemTextColor = const Color.fromARGB(255, 0, 0, 0);

  final String categoryName;
  final List itemsList;
  final Map<String, dynamic> paramItemName = ProfileItemMap().paramItemName;
  final Map<String, List<String>> eachItemToEachParam =
      EachItemToEachParam().eachItemToEachParam;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            // =====================================================カテゴリ名
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
              return SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.amber.withOpacity(0.2),
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(itemName,
                              style: TextStyle(
                                  color: itemTextColor, fontSize: 16)),
                        ),
                      ),
                    ),
                    Container(width: 30, color: Colors.red),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 180,
                        child: EditItemDropDownWidget(
                          itemNameJP: itemName,
                          itemNameParam: itemsList[index],
                          items: eachItemToEachParam[itemsList[index]]!,
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
}

class EditItemDropDownWidget extends ConsumerWidget {
  EditItemDropDownWidget({
    required this.itemNameJP,
    required this.itemNameParam,
    required this.items,
    Key? key,
  }) : super(key: key);

  // 選択肢のリスト
  final String itemNameJP;
  final String itemNameParam;
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
        hint: const Align(
          alignment: Alignment.center,
          child: Text('selectedItem'),
        ),
        value: itemParam.state.isEmpty ? null : itemParam.state,
        onChanged: (value) {},
        buttonHeight: 40,
        itemPadding: EdgeInsets.zero,
        // 選択されている時の表示内容
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 224, 130),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  itemParam.state.toString(),
                  style: const TextStyle(
                    fontSize: 14,
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
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(15, 3, 0, 3),
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 14, overflow: TextOverflow.visible),
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

// ============================================OLD============================================
// ============================================OLD============================================
//
//
//
//
//
//
//
//
class EditProfileItemsList extends StatelessWidget {
  EditProfileItemsList({
    Key? key,
    required this.categoryName,
    required this.itemsList,
  }) : super(key: key);

  final double width = 350;

  final String categoryName;
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
            // =====================================================カテゴリ名
            child: Text(
              categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // =====================================================ListView.builderで項目を作成
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemsList.length, // 作成する項目数＝呼び出し側から受け取った項目数
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
                        // =======================================項目名はリスト順[index]で表示
                        child: Text(
                          itemsList[index].toString(),
                          style: TextStyle(
                            color: itemTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        // itemsList[index]の情報をもとにローカルから値を取得----------------------
                        child: FutureBuilder(
                          // TODO: FirestoreからDocumentSnapshotを取得
                          future: initialize(itemsList[index]),

                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              // TODO: itemList[index] で場合分けをする、編集不可（handleName,age）
                              // =====================================itemNameが'ニックネーム'のときはテキストボックス
                              // =====================================itemNameが'年齢'のときは編集不可の状態に
                              // =====================================それ以外はDropdownItemsWidgetを返す

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

  Future<String> initialize(String itemName) async {
    String nowParam = 'a';
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      nowParam = pref.getString(itemName)!;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return nowParam;
  }
}

// ignore: must_be_immutable
class _DropdownItemsWidget extends ConsumerWidget {
  AutoDisposeStateProvider? getProvider(category) {
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
  final UserModel? user = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(getProvider(itemName)!.state);
    // final isChanged = ref.watch(profileIsChanged.state);
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
          // isChanged.state = true;
          selected = param.state; // 画面の再描写のチェック

          // ======================================================================任意で追加したかったらここ
          // pref.setString('handleName', 'たけし');
/*           user?.handleName = 'Akari';
          String UID = 'hfzPUOf5DhRiTvJKn2QNcUfWwAn2';
          String NAME = 'Akari';
          pref.setString(UID, NAME);
          print(pref.getString(UID)); */

          String newKey = user!.handleName.toString() + itemName;
          pref.setString(itemName, value);
          pref.setString(newKey, param.state);
          // ignore: avoid_print
/*           print(newKey +
              pref.getString(newKey)! +
              ' 変更あり ' +
              isChanged.state.toString()); */
        },
      ),
    );
  }
}
