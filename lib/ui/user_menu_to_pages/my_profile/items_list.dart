import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileItemsList extends StatelessWidget {
  const ProfileItemsList({
    Key? key,
    required this.itemName,
    required this.itemsList,
  }) : super(key: key);

  final double width = 350;

  final String itemName;
  final List<String> itemsList;

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
                              }),
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
}
