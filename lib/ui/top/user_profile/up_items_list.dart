import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewUserProfileItemsList extends StatelessWidget {
  NewUserProfileItemsList({
    Key? key,
    required this.categoryName,
    required this.itemsList,
    required this.documentSnapshot,
  }) : super(key: key);

  // 処理関係
  final String categoryName;
  final List<String> itemsList;
  final Map<String, dynamic> paramItemName = ProfileItemMap().paramItemName;
  final DocumentSnapshot documentSnapshot;

  // デザイン関係
  final double width = 350;
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
              categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // TODO: Crit: '選択しない'となっているパラメータは項目ごと非表示にしたい
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
                        child: Text(
                          paramItemName[itemsList[index]],
                          style: TextStyle(color: itemTextColor, fontSize: 16),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(documentSnapshot
                              .get(itemsList[index])
                              .toString()),
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

// TODO: Crit: ユーザーデータ作成後に修正
class UserProfileItemsList extends StatelessWidget {
  UserProfileItemsList({
    Key? key,
    required this.itemName,
    required this.itemsList,
  }) : super(key: key);

  // 処理関係
  final String itemName;
  final List<String> itemsList;
  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  // デザイン関係
  final double width = 350;
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
                        child: Text(
                          itemsList[index].toString(),
                          style: TextStyle(color: itemTextColor, fontSize: 16),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FutureBuilder(
                            future: initialize(itemsList[index]),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.toString(),
                                );
                              }
                              return Container();
                            },
                          ),
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

  // TODO: FutureBuilderの処理ロジック終了後に削除
  // ========================================================================プロフ更新処理で修正
  Future<String> initialize(String itemName) async {
    String nowParam = 'a';
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      nowParam =
          pref.getString(_currentUser!.handleName.toString() + itemName)!;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return nowParam;
  }
}
