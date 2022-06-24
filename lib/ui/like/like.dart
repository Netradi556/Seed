import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/user_top/user_profile.dart';

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
        child: SizedBox(
          width: double.infinity,
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
  final String livingPlace = '東京';
  final int age = 25;
  final String about = '最近はアフタヌーンティーにはまってます😋';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 227, 225),
          border: Border.all(
            color: const Color(0x0f000000),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const UserProfilePage();
                    },
                  ),
                );
              },
              child: Container(
                height: 330,
                width: 330,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "HandleName",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('25歳'),
                  SizedBox(width: 8),
                  Text('東京'),
                  SizedBox(width: 20),
                  Text('25いいね!'),
                ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 150,
                    color: Colors.amber,
                    child: const Text('保留にする'),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 150,
                    color: Colors.amber,
                    child: const Text('  いいね！ \n (消費なし)'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
