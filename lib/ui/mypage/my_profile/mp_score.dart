import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// プロフィールスコア
class MyProfileScore extends StatelessWidget {
  const MyProfileScore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 351,
      height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
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
            child: CircleGauge(),
          ),
        ],
      ),
    );
  }
}

class CircleGauge extends StatelessWidget {
  const CircleGauge({
    Key? key,
  }) : super(key: key);

  final double gaugePercent = 70; // =============================スコア値パーセンテージ

  @override
  Widget build(BuildContext context) {
    final String scoreText = (gaugePercent * 10).toInt().toString();
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
                value: gaugePercent,
                cornerStyle: CornerStyle.endCurve,
                enableAnimation: true,
                animationDuration: 1200,
                sizeUnit: GaugeSizeUnit.factor,
                // TODO: サークルゲージの色を変更、デザイン修正
                gradient: const SweepGradient(colors: <Color>[
                  Color.fromARGB(255, 244, 221, 107),
                  Color.fromARGB(255, 245, 212, 130)
                ], stops: <double>[
                  0.25,
                  0.75
                ]),
                width: 0.3,
              ),
            ]),
      ],
    );
  }
}
