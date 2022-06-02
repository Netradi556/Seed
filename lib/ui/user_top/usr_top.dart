import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/ui/user_top/user_top_middle.dart';

/*
  マッチング相手を探す画面
  BottomNavigationBarの「さがす」で表示

*/

/*
  ToDo（High）
  ユーザー画像の引き伸ばしをしないように
  アップロード時に画像の範囲選択をするには？
  _TopHeaderContainerWidgetのAlignを_TopMiddleContainerWidgetに移す
  登録中のユーザーの動的表示

*/

class UserTopWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserTopWidget({Key? key}) : super(key: key);

  // white
  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const _UserTopHeaderArea(),
            const UserTopMiddleArea(),
            _UserTopSearchArea(),
          ],
        ),
      ),
    );
  }
}

class _UserTopHeaderArea extends StatelessWidget {
  const _UserTopHeaderArea({
    Key? key,
  }) : super(key: key);

  final Color searchBoxColor = const Color(0xFFFEE9AC);
  final Color searchIconColor = const Color(0xFFFFDA6F);

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
          const SizedBox(height: 5),
          // 検索ボックスを格納しているSizedBox
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Align(
              alignment: const AlignmentDirectional(0.95, 0),
              // 検索ボックス
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchOption();
                    },
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: searchBoxColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // 文字とアイコン
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                        child: Text('絞り込み', style: FlutterFlowTheme.bodyText1),
                      ),
                      Icon(Icons.search, color: searchIconColor, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // カテゴリーを格納しているSizedBox
          const SizedBox(
            width: double.infinity,
            height: 40,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 0),
              child: Align(
                alignment: AlignmentDirectional(-0.05, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: _TopCategoryListWidget(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopCategoryListWidget extends ConsumerWidget {
  const _TopCategoryListWidget({Key? key}) : super(key: key);

  final Color categoryButtonColor = const Color(0xFFFEE9AC);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // カテゴリーの選択状態を反映させるProviderを実装

    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      children: [
        categoryMenu('地域が一緒'),
        categoryMenu('年齢が近い'),
        categoryMenu('共通の趣味'),
        categoryMenu('地域が一緒'),
      ],
    );
  }

  Padding categoryMenu(String categoryName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: InkWell(
        /*
          カテゴリの状態を反映させるProviderの処理を実装

        */
        onTap: () {},
        child: Container(
          width: 100,
          height: 1,
          decoration: BoxDecoration(
            color: categoryButtonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              categoryName,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}

class _UserTopSearchArea extends ConsumerWidget {
  _UserTopSearchArea({
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
          child: GridView(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              UserCard(imagePath: imagePath1),
              UserCard(imagePath: imagePath2),
              UserCard(imagePath: imagePath3),
              UserCard(imagePath: imagePath4),
              UserCard(imagePath: imagePath5),
              UserCard(imagePath: imagePath6),
            ],
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  // 表示するユーザーのプロフィール写真用PATH
  final String imagePath;

  // CardWidgetの枠線の色を指定
  final Color borderlineOutsideCard = const Color.fromARGB(0, 255, 255, 255);
  final Color borderlineShadow = const Color.fromARGB(144, 108, 108, 108);
  final Color userCardBackground = const Color.fromARGB(255, 198, 162, 162);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      alignment: Alignment.center,
      angle: -0.04,
      // 大枠
      child: SizedBox(
        width: 170,
        height: 300,
        // elevationプロパティで影をつける
        // shapeプロパティで枠の形、太さ、色を決定
        child: Material(
          color: userCardBackground,
          elevation: 1,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: borderlineOutsideCard,
            ),
          ),
          // 中枠の余白
          child: Padding(
            padding: const EdgeInsets.fromLTRB(3, 8, 3, 2),
            // 中枠内の配置
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 影の作成のためにMaterialWidgetを利用
                Material(
                  elevation: 0.8,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                    width: 165,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                // 年齢 居住地
                const SizedBox(
                  width: 160,
                  height: 22,
                  child: Align(
                    alignment: Alignment.centerLeft,
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
                ),
                const SizedBox(height: 2),
                // 挨拶文
                const SizedBox(
                  width: 165,
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

// 完成-------------------------------------------------------
class SearchOption extends ConsumerWidget {
  const SearchOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 検索状態を保存するProviderを実装

    const Color pageNameTextColor = Color.fromARGB(255, 0, 0, 0);
    const Color appBarIconColor = Color.fromARGB(255, 0, 0, 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text('検索条件', style: TextStyle(color: pageNameTextColor)),
        iconTheme: const IconThemeData(color: appBarIconColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
            color: appBarIconColor,
          )
        ],
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
