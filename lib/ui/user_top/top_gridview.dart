


class InfiniteGridView extends ConsumerWidget {
  // 表示するデータのList、初期値として20件
  final List<int> items = new List.generate(20, (index) => index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // スクロール検知用のScrollController
    final ScrollController _scrollController = ScrollController();

    // ScrollControllerにイベントリスナーを設定：イベント検知
    _scrollController.addListener(() {
      // 最後までスクロールしたら
      if (_scrollController.position.maxScrollExtent <=
          -_scrollController.position.pixels) {

        // setState()が入る、Provider利用の場合はどうする？
        // データを増やす際にFireStoreから取得しないといけない
        // 一度に取得する情報を多くするのが最適？？
        this
            .items
            .addAll(new List.generate((index) => this.items.length + index));
      }
    });

    return MaterialApp(
        home : Scaffold(
            body: GridView.builder(
                itemBuilder: (BuildContext context, int index) {
                    print("make item: ${index}")
                    
                    // 生成したいWidgetを返す
                    // "#1"のような表示のテキストを生成する
                    return Center(child: Text("#${index}"));
                }
                itemCount: item.length,
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                ),



            )
        )
    );
  }
}