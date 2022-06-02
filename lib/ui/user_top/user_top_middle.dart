import 'package:flutter/material.dart';
import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';

class UserTopMiddleArea extends StatelessWidget {
  const UserTopMiddleArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
          stops: [0, 1],
          begin: AlignmentDirectional(0.34, -1),
          end: AlignmentDirectional(-0.34, 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 7, 0, 0),
            child: Text(
              '似た条件のユーザー',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.horizontal,
                children: const [
                  NearUserCard(),
                  NearUserCard(),
                  NearUserCard(),
                  NearUserCard(),
                  NearUserCard(),
                  NearUserCard(),
                  NearUserCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NearUserCard extends StatelessWidget {
  const NearUserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
