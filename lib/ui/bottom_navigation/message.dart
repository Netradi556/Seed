import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
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
            child: Container(color: Color(0xFF3EC922)),
          ),
        ],
      ),
    );
  }
}
