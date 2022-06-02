import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_app/ui/message/chat_screen.dart';

import 'package:seed_app/view_model/chat_model.dart';

class MessageScreenWidget extends StatelessWidget {
  MessageScreenWidget({
    Key? key,
  }) : super(key: key);

  ChatDatabaseMethod chatDatabaseMethod = ChatDatabaseMethod();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('user').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return Card(
              child: ListTile(
                onTap: () {
                  // チャットの内容（名前・メッセージ）はStreamで取得
                  chatDatabaseMethod.getUserByUsername('');

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ChatScreen();
                      },
                    ),
                  );
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                leading: ClipOval(child: Image.asset('assets/images/demo.png')),
                trailing: const Text('3分前'),
                title: const Text('Mentaくん'),
                subtitle: const Text('Flutter面白い'),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
