import 'package:flutter/material.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileItemsList extends StatelessWidget {
  ProfileItemsList({
    Key? key,
    required this.itemName,
    required this.itemsList,
  }) : super(key: key);

  final double width = 350;
  final String itemName;
  final List<String> itemsList;

  final UserModel? _currentUser = locator.get<UserController>().currentUser;
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
                    // ======================================================================Providerから値を取得して表示するように
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          // itemsList[index]の情報をもとにローカルから値を取得----------------------
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
