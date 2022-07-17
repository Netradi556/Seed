import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_app/models/profile_item_models.dart';

class MyProfileItemsList extends StatelessWidget {
  MyProfileItemsList({
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
          // =======================大カテゴリの表示
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
            itemCount: itemsList.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 190,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              paramItemName[itemsList[index]],
                              style: TextStyle(
                                color: itemTextColor,
                                fontSize: 16,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 10, color: Colors.red.withOpacity(0.2)),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                documentSnapshot
                                    .get(itemsList[index])
                                    .toString(),
                              ),
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
