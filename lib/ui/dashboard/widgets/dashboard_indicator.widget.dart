// Flutter imports:
import 'package:flutter/material.dart';

class BubbleCircularIndicator extends Decoration {
  final double radius;

  /// Color of the indicator, default set to [Colors.black]
  final Color color;

  /// [PagingStyle] determines if the indicator should be fill or stroke, default to fill
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke], default set to 0
  final double strokeWidth;

  const BubbleCircularIndicator({
    this.radius = 25,
    this.color = Colors.black,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 2,
  });
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      color: color,
      paintingStyle: paintingStyle,
      strokeWidth: strokeWidth,
      radius: radius,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final BubbleCircularIndicator decoration;
  final double radius;
  final Color color;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged, {
    required this.color,
    required this.radius,
    required this.paintingStyle,
    required this.strokeWidth,
  }) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(strokeWidth >= 0 &&
        strokeWidth < configuration.size!.width / 2 &&
        strokeWidth < configuration.size!.height / 2);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.

    final myOffset = Offset(offset.dx + (configuration.size!.width / 2),
        offset.dy + (configuration.size!.height / 2));
    final paint = Paint();
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = 3;
    // canvas.drawOval(rect, paint);
    canvas.drawCircle(myOffset, radius, paint);
  }
}
