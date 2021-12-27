import 'package:flutter/material.dart';

void main() {
    runApp(const Navigator2test());
}

class Navigator2test extends StatefulWidget {
    const Navigator2test{key? key}) : super(key:key);

    @override
    State<Navigator2test> createState() => _Navigator2testState()l;

}

class _Navigator2testState extends State<Navigator2test> {
    // 表示Pageを管理する状態
    // 1ならPage1、2ならPage2といった形で管理する
    int? _buttonId;
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Books App',
            // 宣言的な画面遷移の管理部分
            // _buttonIdの値によって変化する
            home: Navigator(
                pages: [
                    MateriariPage(
                        child: MenuPage(
                            toPage1: _toPage1,
                            toPage2: _toPage2,
                            toPage3: _toPage3,
                        ),
                    ),
                    if (_buttonId == 1)
                        const MateriariPage(
                            child: Page1(),
                        ),
                    if (_buttonId == 2)
                        const MateriariPage(
                            child: Page2(),
                        ),
                    if (_buttonId == 3)
                        const MateriariPage(
                            child: Page3(),
                        ), 
                ],
                onPopPage: (route, result) {
                    if (!route.didPop(result)) {
                        return false;
                    }
                    setState(() {
                        _buttonId = null;
                    });
                    return true;
                },
            ),
        );
    }

    // ページ管理のためのコールバック関数
    // 管理している状態の数値を変更する
    void _toPage1() {
        setState(() {
            _buttonId = 1;
        });
    }

    void _toPage2() {
        setState(() {
            _buttonId = 2;
        });
    }

    void _toPage3() {
        setState(() {
            _buttonId = 3;
        });
    }



}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key, this.toPage1, this.toPage2, this.toPage3})
      : super(key: key);
 
  //画面遷移を指示するコールバック関数
  //ボタンが押された時に反応する
  final void Function()? toPage1;
  final void Function()? toPage2;
  final void Function()? toPage3;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: toPage1, child: const Text('Page1')),
            ElevatedButton(onPressed: toPage2, child: const Text('Page2')),
            ElevatedButton(onPressed: toPage3, child: const Text('Page3')),
          ],
        ),
      ),
    );
  }
}
 
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      backgroundColor: Colors.red,
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
 
class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      backgroundColor: Colors.blue,
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
 
class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page3'),
      ),
      backgroundColor: Colors.green,
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}






