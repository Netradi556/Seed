import 'package:flutter/material.dart';

class ProfileItemsList extends StatelessWidget {
  const ProfileItemsList({
    required this.itemName,
    required this.itemsList,
  });

  final String itemName;
  final List<String> itemsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(itemName),
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemsList.length,
          itemBuilder: (BuildContext context, index) {
            return SizedBox(
              width: 80,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(itemsList[index].toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('値１'), // itemsList[index]の情報をもとにローカルから値を取得
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
