import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
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
                child: Column(
                  children: const <Widget>[
                    rightBalloon(),
                    leftBalloon(),
                    rightBalloon(),
                    leftBalloon(),
                    rightBalloon(),
                  ],
                ),
              ),
            ),
            const textInputWidget(),
          ],
        ),
      ),
    );
  }
}

class leftBalloon extends StatelessWidget {
  const leftBalloon({
    Key? key,
  }) : super(key: key);

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
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('すごい速度でUIが組み上がっていて楽しい!'),
            ),
          ),
        ],
      ),
    );
  }
}

class rightBalloon extends StatelessWidget {
  const rightBalloon({
    Key? key,
  }) : super(key: key);

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
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flutterって便利だね!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }
}

class textInputWidget extends StatelessWidget {
  const textInputWidget({
    Key? key,
  }) : super(key: key);

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
              child: const TextField(
                autofocus: true,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            color: Colors.black54,
            iconSize: 28,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
