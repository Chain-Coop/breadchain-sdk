import 'package:breadchain_sdk/config/colors.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.value,
    this.onChanged,
  });

  final double value;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackShape: _CustomSliderTrackShape(),
        thumbShape: _CustomSliderThumbShape(),
        overlayShape: _CustomSliderOverlayShape(thumbRadius: 10),
      ),
      child: Slider(
        value: value,
        max: 500,
        divisions: 500,
        thumbColor: AppColors.primary,
        activeColor: AppColors.primary,
        inactiveColor: AppColors.primary.withValues(alpha: .1),
        onChanged: onChanged,
      ),
    );
  }
}

class _CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const _CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  // @override
  // void paint(
  //   PaintingContext context,
  //   Offset offset, {
  //   double additionalActiveTrackHeight = 2.0,
  //   required RenderBox parentBox,
  //   required SliderThemeData sliderTheme,
  //   required Animation<double> enableAnimation,
  //   required TextDirection textDirection,
  //   required Offset thumbCenter,
  //   Offset? secondaryOffset,
  //   bool isDiscrete = false,
  //   bool isEnabled = false,
  // }) {
  //   if (sliderTheme.trackHeight == 0) {
  //     return;
  //   }
  //   final Paint activeTrackPaint = Paint()
  //     ..color = sliderTheme.activeTrackColor!
  //     ..style = PaintingStyle.fill
  //     ..strokeWidth = 4.0; // Width for active track

  //   final Paint inactiveTrackPaint = Paint()
  //     ..color = sliderTheme.inactiveTrackColor!
  //     ..style = PaintingStyle.fill
  //     ..strokeWidth = 8.0; // Width for inactive track

  //   const double trackHeight = 2.0; // Default track height

  //   // Define the track rectangle sizes
  //   final Rect activeTrackRect = Rect.fromLTRB(
  //     offset.dx,
  //     offset.dy - trackHeight / 2,
  //     thumbCenter.dx,
  //     offset.dy + trackHeight / 2,
  //   );

  //   final Rect inactiveTrackRect = Rect.fromLTRB(
  //     thumbCenter.dx,
  //     offset.dy - trackHeight,
  //     offset.dx + parentBox.size.width,
  //     offset.dy + trackHeight,
  //   );

  //   // Draw the inactive track
  //   context.canvas.drawRect(inactiveTrackRect, inactiveTrackPaint);

  //   // Draw the active track
  //   context.canvas.drawRect(activeTrackRect, activeTrackPaint);
  // }
}

class _CustomSliderThumbShape extends RoundSliderThumbShape {
  const _CustomSliderThumbShape();

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class _CustomSliderOverlayShape extends RoundSliderOverlayShape {
  final double thumbRadius;

  const _CustomSliderOverlayShape({this.thumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(
        context, center.translate(-(value - 0.5) / 0.5 * thumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}
