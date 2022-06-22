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
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              child: const Text('広告orコンテンツ表示欄'),
              width: double.infinity,
              color: const Color(0xFF3EC922),
            ),
            const _LikeExpandWidget(),
          ],
        ),
      ),
    );
  }
}

class _LikeExpandWidget extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F8F7),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.05, 0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
          child: Container(),
        ),
      ),
    );
  }
}

class ReceivedGoodCard extends StatelessWidget {
  const ReceivedGoodCard({
    Key? key,
    required this.imagePath8,
  }) : super(key: key);

  final String imagePath8;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            height: 400,
            child: Material(
              color: Colors.white,
              elevation: 1,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color(0x000a0a0a),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      height: 190,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0x0f000000),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imagePath8),
                                  fit: BoxFit.fill),
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.50),
                    const SizedBox(
                      width: 107,
                      height: 30,
                      child: Text(
                        "25歳  東京",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.50),
                    const SizedBox(
                      width: 156,
                      height: 60,
                      child: Text(
                        "このご時世ですが前向きに進めたいのでまた再開😄",
                        style: TextStyle(
                          color: Color(0x75000000),
                          fontSize: 13,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
