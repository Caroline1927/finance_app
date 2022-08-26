import 'package:finance_app/models/streamBuilder_sum_per_day.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  const RadialGauge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          ranges: [
            GaugeRange(startValue: 0, endValue: 200, color: Colors.green),
            GaugeRange(startValue: 200, endValue: 500, color: Colors.yellowAccent),
            GaugeRange(startValue: 500, endValue: 1000, color: Colors.red)
          ],
          pointers: <GaugePointer>[
            RangePointer(value: sumCurrentTransactions)],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(widget: Container(child:
            Text("${sumCurrentTransactions}",style: TextStyle(fontSize: 20, color: Colors.orangeAccent))
            // StreamBuilderSumPerDay()
            ),
                angle: 90, positionFactor: 0.1
            )],
          canScaleToFit: true,
          startAngle: 180,
          endAngle: 180,
          showLabels: false,
          showTicks: false,
          minimum: 0,
          maximum: 1000,
          interval: 10,
          radiusFactor: 0.26,
          axisLineStyle: const AxisLineStyle(
            thickness: 0.2,
            color: Colors.orangeAccent,
            thicknessUnit: GaugeSizeUnit.factor,
            // cornerStyle: CornerStyle.bothCurve,
          ),
          // pointers: <GaugePointer>[
          //   RangePointer(
          //     // value: progressValue,
          //     width: 0.1,
          //     sizeUnit: GaugeSizeUnit.factor,
          //     // cornerStyle: CornerStyle.bothCurve,
          //     enableAnimation: true,
          //     animationType: AnimationType.linear,
          //   )
          // ],
        ),
      ],
    );
  }
}
