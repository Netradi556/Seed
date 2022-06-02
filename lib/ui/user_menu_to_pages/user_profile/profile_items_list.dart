import 'package:flutter/material.dart';

class ProfileItemsList extends StatelessWidget {
  const ProfileItemsList({
    Key? key,
    required this.itemName,
    required this.itemsList,
  }) : super(key: key);

  final String itemName;
  final List<String> itemsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
