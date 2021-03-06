import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// プロフィールスコア
class UserProfileScore extends StatelessWidget {
  const UserProfileScore({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    final int scoreInt = documentSnapshot.get('score');
    final scoreDouble = scoreInt.toDouble();
    return SizedBox(
      width: 351,
      height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 351,
            height: 50,
            child: Text(
              "プロフィールスコア",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 270,
            child: CircleGauge(score: scoreDouble),
          ),
        ],
      ),
    );
  }
}

class CircleGauge extends StatelessWidget {
  const CircleGauge({
    Key? key,
    required this.score,
  }) : super(key: key);

  final double score; // =============================スコア値パーセンテージ

  @override
  Widget build(BuildContext context) {
    final String scoreText = score.round().toString();
    final double scorePercent = score / 10;
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          startAngle: 270, // 開始点 中央右端が0
          endAngle: 270, // 終了点
          radiusFactor: 1, // 円の半径
          axisLineStyle: const AxisLineStyle(
              color: Color.fromARGB(247, 231, 226, 198),
              thicknessUnit: GaugeSizeUnit.factor,
              thickness: 0.3),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 180,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                        child: Text(
                          scoreText, // =================================================スコア値を実装
                          style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 3,
                    indent: 90,
                    endIndent: 130,
                    color: Color.fromARGB(32, 0, 0, 0),
                  ),
                  const SizedBox(
                    width: 130,
                    child: Text(
                      '現在のスコア',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(100, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          pointers: <GaugePointer>[
            RangePointer(
              // ===============================================インジケーターのポイント（パーセンテージ）
              value: scorePercent,
              cornerStyle: CornerStyle.endCurve,
              enableAnimation: true,
              animationDuration: 1200,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: const SweepGradient(
                colors: <Color>[
                  Color.fromARGB(255, 244, 221, 107),
                  Color.fromARGB(255, 245, 212, 130)
                ],
                stops: <double>[0.25, 0.75],
              ),
              width: 0.3,
            ),
          ],
        ),
      ],
    );
  }
}
