import 'package:flutter/material.dart';
import 'package:seed_app/flutter_flow/flutter_flow_theme.dart';

const String imagePath1 = 'assets/images/userXX.jpg';
const String imagePath2 = 'assets/images/userXX1.jpg';
const String imagePath3 = 'assets/images/userXX2.jpg';
const String imagePath4 = 'assets/images/user4.jpg';

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
          colors: [
            Color.fromARGB(180, 253, 209, 76),
            Color.fromARGB(255, 249, 231, 168)
          ],
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
                  NearUserCard(imgPath: imagePath1),
                  NearUserCard(imgPath: imagePath2),
                  NearUserCard(imgPath: imagePath3),
                  NearUserCard(imgPath: imagePath4),
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
    required this.imgPath,
    Key? key,
  }) : super(key: key);
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(233, 239, 238, 229),
              width: 3,
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage(imgPath),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
