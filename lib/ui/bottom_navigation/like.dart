import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var listItem = ['User 1', 'User 2', 'User 3'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                color: Color(0xFFD57575),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('メッセージ'),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                child: Text('広告orコンテンツ表示欄'),
                width: double.infinity,
                color: Color(0xFF3EC922),
              ),
            ),
            _LikeExpandWidget(),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 100,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0xFFF1F8F7),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.05, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
            child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
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
