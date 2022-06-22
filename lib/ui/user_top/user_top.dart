import 'package:flutter/cupertino.dart';
import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/serch_option_provider.dart';
import 'package:seed_app/ui/user_top/top_gridview.dart';
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

  // white SafeAreaあたりの色が変わるだけ
  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            _UserTopHeaderArea(),
            UserTopMiddleArea(),
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
      height: 90,
      decoration: const BoxDecoration(
        color: Color.fromARGB(237, 255, 255,
            255), // Color(0xFFEEEEEE), // ==========================================変数で
      ),
      child: Column(
        children: [
          const SizedBox(height: 1),
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
            height: 35,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
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
  const _UserTopSearchArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: InfiniteGridView(),
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

    final idProof = ref.watch(idProofProvider.state);
    final incomeProof = ref.watch(incomeProofProvider.state);
    final bacheloretteProof = ref.watch(bacheloretteProofProvider.state);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // エリア選択
            Container(
              width: double.infinity,
              height: 100,
              color: const Color.fromARGB(104, 152, 136, 136),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('エリア',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '居住地',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '東京、千葉、埼玉',
                          style: TextStyle(fontSize: 18, color: Colors.amber),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            // 確認書類
            Container(
              width: double.infinity,
              color: const Color.fromARGB(104, 152, 136, 136),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('認証',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700)),
                    ProofStateSwitch(itemName: '本人確認', proofType: idProof),
                    ProofStateSwitch(itemName: '収入証明', proofType: incomeProof),
                    ProofStateSwitch(
                        itemName: '独身証明', proofType: bacheloretteProof)
                  ],
                ),
              ),
            ),

            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ProofStateSwitch extends StatelessWidget {
  const ProofStateSwitch({
    Key? key,
    required this.itemName,
    required this.proofType,
  }) : super(key: key);

  final String itemName;
  final StateController<bool> proofType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName.toString(),
            style: const TextStyle(fontSize: 18),
          ),
          CupertinoSwitch(
            activeColor: Colors.amber,
            value: proofType.state,
            onChanged: (value) {
              proofType.state = value;
            },
          )
        ],
      ),
    );
  }
}
