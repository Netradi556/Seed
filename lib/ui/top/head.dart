import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/provider/serch_option_provider.dart';
import 'package:seed_app/ui/top/top.dart';

class UserTopHeaderArea extends StatelessWidget {
  const UserTopHeaderArea({
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
                      return SearchOption();
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

class SearchOption extends ConsumerWidget {
  SearchOption({Key? key}) : super(key: key);

  final ProfileItemJAP profileItem = ProfileItemJAP();

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
        child: SingleChildScrollView(
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
              const Divider(thickness: 2, indent: 30, endIndent: 30),
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
                      ProofStateSwitch(
                          itemName: '収入証明', proofType: incomeProof),
                      ProofStateSwitch(
                          itemName: '独身証明', proofType: bacheloretteProof)
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 2, indent: 30, endIndent: 30),
              const SearchItemsList(itemName: '表示設定', itemsList: ['']),

              SearchItemsList(
                  itemName: '基本情報', itemsList: profileItem.basicInfo),
              const Divider(thickness: 2, indent: 30, endIndent: 30),
              SearchItemsList(
                  itemName: '学歴・職種・外見', itemsList: profileItem.lifeStyleInfo),
              const Divider(thickness: 2, indent: 30, endIndent: 30),
              SearchItemsList(
                  itemName: '性格・趣味・生活', itemsList: profileItem.socialInfo),
              const Divider(thickness: 2, indent: 30, endIndent: 30),
              SearchItemsList(
                  itemName: '恋愛・結婚について', itemsList: profileItem.viewOfLove),
              const Divider(thickness: 2, indent: 30, endIndent: 30),
              const SearchItemsList(
                  itemName: 'プレミアムオプション', itemsList: ['フリーワード', 'いいね数']),
            ],
          ),
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

class SearchItemsList extends StatelessWidget {
  const SearchItemsList({
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
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('aa'),
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
