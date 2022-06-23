import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Color appBarIconColor = const Color.fromARGB(255, 0, 0, 0);

  LikePageWidget({Key? key}) : super(key: key);

  final Color backgroundColor = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title:
            const Text('あなたに届いたいいね！', style: TextStyle(color: Colors.black87)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
            color: appBarIconColor,
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            color: const Color(0xFF3EC922),
            child: const Text('広告orコンテンツ表示欄'),
          ),
          const _LikeExpandWidget(),
        ],
      ),
    );
  }
}

class _LikeExpandWidget extends StatelessWidget {
  const _LikeExpandWidget({
    Key? key,
  }) : super(key: key);

  final String imagePath1 = 'assets/images/user1.jpg';
  final String imagePath2 = 'assets/images/user2.jpg';
  final String imagePath3 = 'assets/images/user3.jpg';
  final String imagePath4 = 'assets/images/user4.jpg';
  final String imagePath5 = 'assets/images/user5.jpg';
  final String imagePath6 = 'assets/images/user6.jpg';
  final String imagePath7 = 'assets/images/user7.jpg';
  final String imagePath8 = 'assets/images/user8.jpg';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return ReceivedGoodCard(imagePath: imagePath1);
            },
          ),
        ),
      ),
    );
  }
}

class ReceivedGoodCard extends StatelessWidget {
  const ReceivedGoodCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: const Color(0x0f000000),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.fill),
              border: Border.all(
                width: 1,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 2.5, 10, 0),
            height: 30,
            child: const Text(
              "25歳  東京",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 2.5, 10, 0),
            height: 90,
            child: const Text(
              "最近はアフタヌーンティーにはまってます😋",
              style: TextStyle(
                color: Color(0x75000000),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
