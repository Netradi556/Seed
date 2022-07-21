import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/provider/profile_provider.dart';

class EditAbout extends ConsumerWidget {
  const EditAbout({Key? key}) : super(key: key);

  // デザイン関係
  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutParam = ref.watch(profileAboutProvider.state);
    final isAboutChanged = ref.watch(profileAboutIsChangedProvider.state);
    final editingContents = ref.watch(profileEditingContents.state);
    final isChanged = ref.watch(profileIsChangedAuto.state);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            if (isAboutChanged.state) {
              isAboutChanged.state = false;
              isChanged.state = true;
              editingContents.state = {'about': aboutParam.state};
            }
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        elevation: .6,
        title: Text('自己紹介文', style: TextStyle(color: appBarTextColor)),
        backgroundColor: appBarBackgroundColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
              stops: [0, 1],
              begin: AlignmentDirectional(0.34, -1),
              end: AlignmentDirectional(-0.34, 1),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // TODO: Low: 自己紹介文の書き方コンテンツを作成
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '自己紹介文の書き方のコツはこちら！',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Container(
            height: 400,
            color: Colors.blue.withOpacity(0.3),
            // TODO: Crit: TextFormを実装
            child: TextFormField(
              initialValue: aboutParam.state,
              onChanged: (String value) {
                aboutParam.state = value;
                isAboutChanged.state = true;
              },
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
                overflow: TextOverflow.clip,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              inputFormatters: [LengthLimitingTextInputFormatter(400)],
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '入力欄はこちら',
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
              // TODO: High: ユーザーの入力内容に応じてバリデーションを実装
              // 参考：https://dev.classmethod.jp/articles/flutter-inline-validation/
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: InkWell(
              child: Container(
                height: 40,
                width: 100,
                color: Colors.amber.withOpacity(0.2),
              ),
              onTap: () {
                // TODO: Crit :編集内容の確定処理を実装
              },
            ),
          ),
        ],
      ),
    );
  }
}
