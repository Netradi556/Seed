// Packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

// Provider
import 'package:seed_app/view_model/util_auth.dart';
import 'package:seed_app/view_model/provider_auth.dart';
import 'package:seed_app/ui/bottom_navigation/navigtion_controller.dart';

// PageWidgets
import 'auth.dart';
import 'introduction.dart';

// 画像のパス格納用
String upperImagefilePath = '';

class RegistrationPageController extends ConsumerWidget {
  PageController? pageViewController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Align(
        alignment: const AlignmentDirectional(-0.05, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(upperImagefilePath),
            const Spacer(),
            Container(
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: PageView(
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/222/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://picsum.photos/seed/30/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://picsum.photos/seed/543/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://picsum.photos/seed/140/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: ElevatedButton(
                child: const Text('はじめる'),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationPageController(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class RegistrationPage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    return Scaffold();
  }
}

class RegistrationPage2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    return Scaffold();
  }
}

class RegistrationPage3 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    return Scaffold();
  }
}

class RegistrationPage4 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    return Scaffold();
  }
}
