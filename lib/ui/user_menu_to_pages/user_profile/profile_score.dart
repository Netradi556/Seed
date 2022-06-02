import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// プロフィールスコア
class ProfileScore extends StatelessWidget {
  const ProfileScore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 351,
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 351,
            height: 45,
            child: Text(
              "プロフィールスコア",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const CircleGauge(),
          ),
          const SizedBox(
            height: 30,
            child: Text('現在のスコア'),
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

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.8,
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 180,
                  widget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text(
                        '500',
                        style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        ' / 1000',
                        style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  )),
            ],
            pointers: const <GaugePointer>[
              RangePointer(
                  value: 50,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 1200,
                  sizeUnit: GaugeSizeUnit.factor,
                  gradient: SweepGradient(
                      colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
                      stops: <double>[0.25, 0.75]),
                  color: Color(0xFF00A8B5),
                  width: 0.15),
            ]),
      ],
    );
  }
}
