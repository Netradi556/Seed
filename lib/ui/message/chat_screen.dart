import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seed_app/repository/firestore_repo.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text(
          'Mentaくん1',
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
                  horizontal: 16.0,
                  vertical: 32.0,
                ),
                child: ChatTest(),
              ),
            ),
            TextInputWidget(),
          ],
        ),
      ),
    );
  }
}

class ChatTest extends StatelessWidget {
  ChatTest({Key? key}) : super(key: key);

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
            var text = '${docs[index]['message']}';

            /* 'メッセージ：'
                '${docs[index]['message']} \n'
                '送信者：'
                '${docs[index]['sender']} \n';
 */
            if (docs[index]['sender'] == userID) {
              return RightBalloon(message: text);
            } else {
              return LeftBalloon(message: text);
            }
          },
        );
      },
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
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        children: [
          CircleAvatar(
            child: ClipOval(
              child: Image.asset('assets/images/demo.png'),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 233, 233, 233),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Align(
        alignment: Alignment.centerRight,
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
              padding: const EdgeInsets.all(16.0),
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            )),
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
                  border: const OutlineInputBorder(),
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
