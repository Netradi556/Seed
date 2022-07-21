import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seed_app/repository/firestore_repo.dart';

// TODO: 機能追加: メッセージの送信日時別にまとめる

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text(
          'Akari',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: ChatContents(),
              ),
            ),
            TextInputWidget(),
          ],
        ),
      ),
    );
  }
}

class ChatContents extends StatelessWidget {
  ChatContents({Key? key}) : super(key: key);

// https://muchilog.com/flutter-create-listview-lilke-talkapp/
// scrollControllerインスタンスのanimateTo()を0.0と指定すると一番下(トークの最新値)の場所まで飛べる様になります。

  final FireStoreRepo fireStoreRepo = FireStoreRepo();

  final String userID = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStoreRepo.getChatStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('$snapshot.error'));
        } else if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
        var docs = snapshot.data!.docs;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          reverse: true,
          itemCount: docs.length,
          itemBuilder: (context, index) {
            var text = '${docs[index]['message']} $index';

            // 送信者がログイン中のユーザーであればRightBalloon
            if (docs[index]['sender'] == userID) {
              return RightBalloon(message: text);
            } else {
              // 送信者がログイン中のユーザーではない
              try {
                if (docs.length > index &&
                    docs[index + 1]['sender'] != userID) {
                  return LeftBalloonNoPic(message: text);
                }
              } catch (error) {
                // nothing
              }

              return LeftBalloon(message: text);
            }
          },
        );
      },
    );
  }
}

class LeftBalloonNoPic extends StatelessWidget {
  const LeftBalloonNoPic({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;
  final Color textColor = const Color.fromARGB(255, 6, 6, 6);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 40),
          const SizedBox(
            width: 10.0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 270),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
                child: Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    overflow: TextOverflow.clip,
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

class LeftBalloon extends StatelessWidget {
  const LeftBalloon({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;
  final Color textColor = const Color.fromARGB(255, 6, 6, 6);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: [
          const SizedBox(
            width: 40,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user2.jpg'),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 270),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
                child: Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    overflow: TextOverflow.clip,
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

// TODO: High: 自分のチャットが続いた時に感覚を縮める
class RightBalloon extends StatelessWidget {
  const RightBalloon({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;
  final Color textColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 270),
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [
                    Color.fromARGB(255, 108, 132, 235),
                    Color.fromARGB(250, 132, 199, 250),
                  ],
                  stops: [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
                child: Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    overflow: TextOverflow.clip,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  TextInputWidget({
    Key? key,
  }) : super(key: key);

  final TextEditingController _editingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Color sendIconColor = const Color.fromARGB(255, 70, 232, 84);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            color: Colors.black54,
            iconSize: 28,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.photo_outlined),
            color: Colors.black54,
            iconSize: 28,
            onPressed: () {},
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(48),
              ),
              child: TextFormField(
                key: _formKey,
                controller: _editingController,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      FirebaseFirestore.instance.collection('chatsample').add(
                        {
                          'message': _editingController.text.toString(),
                          'timestamp': DateTime.now().millisecondsSinceEpoch,
                          'sender':
                              FirebaseAuth.instance.currentUser?.uid.toString(),
                        },
                      );
                      _editingController.clear();
                    },
                  ),
                  suffixIconColor: sendIconColor,
                  border: InputBorder.none,
                  hintText: 'Type here',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
