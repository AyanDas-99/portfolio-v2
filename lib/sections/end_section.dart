import 'package:flutter/material.dart';
import 'package:portfolio_1/theme/custom_theme.dart';

class EndSection extends StatelessWidget {
  const EndSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: 300,
      height: 100,
      child: CustomPaint(
        painter: Design(),
        size: Size(size.width / 2, 200),
      ),
    );
  }
}

class Design extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CustomTheme.lightGrey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final shape = Path();
    shape.moveTo(0, size.height / 2);
    shape.arcToPoint(
      Offset(size.width / 4, size.height * 0.3),
      radius: const Radius.elliptical(3, 1),
      clockwise: false,
    );
    shape.arcToPoint(
      Offset(size.width / 2, size.height / 2),
      radius: const Radius.elliptical(3, 1),
      clockwise: false,
    );
    shape.arcToPoint(
      Offset(size.width * (3 / 4), size.height * 0.3),
      radius: const Radius.elliptical(3, 1),
      clockwise: false,
    );
    shape.arcToPoint(
      Offset(size.width, size.height / 2),
      radius: const Radius.elliptical(3, 1),
      clockwise: false,
    );
    canvas.drawPath(shape, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
