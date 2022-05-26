// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: unused_import
import 'package:seed_app/ui/auth_to_intro/intro/introduction.dart';
import 'package:seed_app/ui/auth_to_intro/auth/auth.dart';
import 'package:seed_app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Seed',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthPageWidget(),
      ),
    );
  }
}
