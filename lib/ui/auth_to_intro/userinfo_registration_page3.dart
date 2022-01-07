// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PageWidgets
import 'package:seed_app/ui/bottom_navigation/navigtion_controller.dart';

class RegistrationPage3 extends ConsumerWidget {
  const RegistrationPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              width: 400, // 余白にフィットさせる方法？
              height: 300,
              color: Colors.amber,
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.brown,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text('aaa'),
                onPressed: () async {
                  await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NavigationPageController();
                  }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
