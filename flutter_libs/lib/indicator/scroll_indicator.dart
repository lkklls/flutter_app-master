import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({Key key, this.cardCount, this.scrollPercent}) : super(key: key);

  final int cardCount;
  final double scrollPercent;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollIndicatorPainter(cardCount: cardCount, scrollPercent: scrollPercent),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  ScrollIndicatorPainter({this.cardCount, this.scrollPercent})
      : trackPaint = Paint()
          ..color = const Color(0xFF444444)
          ..style = PaintingStyle.fill,
        thumbPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

  final int cardCount;
  final double scrollPercent;
  final Paint trackPaint;
  final Paint thumbPaint;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            topLeft: const Radius.circular(3.0),
            topRight: const Radius.circular(3.0),
            bottomLeft: const Radius.circular(3.0),
            bottomRight: const Radius.circular(3.0)),
        trackPaint);

    final thumbWidth = size.width / cardCount;
    final thumbLeft = scrollPercent * size.width;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(thumbLeft, 0.0, thumbWidth, size.height),
            topLeft: const Radius.circular(3.0),
            topRight: const Radius.circular(3.0),
            bottomLeft: const Radius.circular(3.0),
            bottomRight: const Radius.circular(3.0)),
        thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
