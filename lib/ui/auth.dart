// Login or Sing up

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/view_model/Provider_auth.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class AuthPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
        backgroundColor: Color(0xFF42A5F5),
        body: Container(
            color: Colors.blue,
            width: 300.0,
            height: 300.0,
            child: Text('word')));
  }
}
