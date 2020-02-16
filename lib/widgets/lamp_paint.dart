import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  RectanglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

  // @override
  // void paint(Canvas canvas, Size size) {
  //   Paint paint = Paint()
  //     ..color = strokeColor
  //     ..strokeWidth = strokeWidth
  //     ..style = paintingStyle;

  //   canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  // }

  // Path getTrianglePath(double x, double y) {
  //   return Path()
  //     ..moveTo(0, y)
  //     ..lineTo(x / 2, 0)
  //     ..lineTo(x, y)
  //     ..lineTo(0, y);
  // }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.addRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4), Radius.circular(16))
    );
    Path secondPath = Path();
    secondPath.lineTo(size.width / 2, size.height / 2);
    path.addPath(secondPath, Offset(16, 16));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RectanglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

//  @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8.0;

//     Path path = Path();
//     path.addRRect(
//         RRect.fromRectAndRadius(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4), Radius.circular(16))
//     );
//     Path secondPath = Path();
//     secondPath.lineTo(size.width / 2, size.height / 2);
//     path.addPath(secondPath, Offset(16, 16));
//     canvas.drawPath(path, paint);
//   }