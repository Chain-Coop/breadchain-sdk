import 'package:flutter/material.dart';

import 'package:breadchain_sdk/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SemiCircularProgressBar extends StatelessWidget {
  final double value;

  const SemiCircularProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 100,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 180,
            endAngle: 0,
            canScaleToFit: true,
            showLabels: false,
            showTicks: false,
            radiusFactor: 1.2,
            axisLineStyle: AxisLineStyle(
              thickness: 0.23,
              thicknessUnit: GaugeSizeUnit.factor,
              color: const Color(0xFF1D8500).withAlpha(20),
              cornerStyle: CornerStyle.bothCurve,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: value,
                width: 0.23,
                color: AppColors.primary,
                pointerOffset: 0,
                sizeUnit: GaugeSizeUnit.factor,
                enableAnimation: true,
                animationType: AnimationType.easeOutBack,
                cornerStyle: CornerStyle.bothCurve,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  children: [
                    Text(
                      '${value.toInt()}%',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                positionFactor: 0.1,
                angle: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
