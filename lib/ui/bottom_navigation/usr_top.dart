import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  マッチング相手を探す画面
  BottomNavigationBarの「さがす」で表示

*/

/*
  ToDo（High）
  _TopHeaderContainerWidgetのAlighnを_TopMiddleContainerWidgetに移す
  登録中のユーザーの動的表示

*/

class UserTopWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 167, 86, 86),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const _TopHeaderContainerWidget(),
            const _TopMiddleContainerWidget(),
            _TopUserExpandWidget(),
          ],
        ),
      ),
    );
  }
}

class _TopHeaderContainerWidget extends StatelessWidget {
  const _TopHeaderContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // 検索ボックスに見せかけたコンテナ onTap()を実装予定
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(),
            child: Align(
              alignment: const AlignmentDirectional(1, -0.1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 10, 0),
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE9AC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                        child: Text(
                          '絞り込み',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        color: Color(0xFFFFDA6F),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ロジック実装時に修正：_TopMiddleContainerWidgetに移す
          Align(
            alignment: const AlignmentDirectional(0.1, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 9, 0, 5),
              child: Container(
                width: double.infinity,
                height: 35,
                decoration: const BoxDecoration(),
                child: const Align(
                  alignment: AlignmentDirectional(-0.05, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: _TopCategoryListWidget(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopMiddleContainerWidget extends StatelessWidget {
  const _TopMiddleContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
          stops: [0, 1],
          begin: AlignmentDirectional(0.34, -1),
          end: AlignmentDirectional(-0.34, 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 7, 0, 0),
            child: Text(
              '似た条件のユーザー',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopUserExpandWidget extends ConsumerWidget {
  _TopUserExpandWidget({
    Key? key,
  }) : super(key: key);
  String imagePath1 = 'assets/images/user1.jpg';
  String imagePath2 = 'assets/images/user2.jpg';
  String imagePath3 = 'assets/images/user3.jpg';
  String imagePath4 = 'assets/images/user4.jpg';
  String imagePath5 = 'assets/images/user5.jpg';
  String imagePath6 = 'assets/images/user6.jpg';
  String imagePath7 = 'assets/images/user7.jpg';
  String imagePath8 = 'assets/images/user8.jpg';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Color(0xFFF1F8F7),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.05, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  UserCardWidget(imagePath1: imagePath1),
                  Transform.rotate(
                    angle: 0.03,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(imagePath2),
                                                  fit: BoxFit.fill),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(imagePath3),
                                                  fit: BoxFit.fill),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(imagePath4),
                                                  fit: BoxFit.fill),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(imagePath5),
                                                  fit: BoxFit.fill),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(imagePath6),
                                                  fit: BoxFit.fill),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(imagePath7),
                                                  fit: BoxFit.fill),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      width: 184,
                      height: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 184,
                            height: 300,
                            child: Material(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
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
                                      width: 172,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0x0f000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 107,
                                      height: 22,
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
                                    SizedBox(height: 2.50),
                                    SizedBox(
                                      width: 156,
                                      height: 41,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    Key? key,
    required this.imagePath1,
  }) : super(key: key);

  final String imagePath1;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.04,
      // 大枠
      child: SizedBox(
        width: 184,
        height: 300,
        // elevationプロパティで影をつける
        // shapeプロパティで枠の形、太さ、色を決定
        child: Material(
          color: Colors.white,
          elevation: 1,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Color(0x000a0a0a),
            ),
          ),
          // 中枠の余白
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            // 中枠内の配置
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 172,
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
                        width: 170,
                        height: 190,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imagePath1), fit: BoxFit.fill),
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
                  height: 22,
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
                  height: 41,
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
    );
  }
}

class _TopCategoryListWidget extends ConsumerWidget {
  const _TopCategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFFEE9AC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Text(
                '地域が一緒',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.bodyText1,
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFEE9AC),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  '年齢が近い',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText1,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFEE9AC),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  '共通の趣味',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText1,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFEE9AC),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  '地域が一緒',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
