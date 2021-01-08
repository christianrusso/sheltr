import 'package:flutter/cupertino.dart';

class BottomBarClipper extends CustomClipper<Path> {
  double position;
  BottomBarClipper(this.position);

  @override
  Path getClip(Size size) {
    final path = new Path()
      ..moveTo(0, 0)
      ..lineTo(position - 10, 0.0)
      ..arcToPoint(Offset(position + 70, 0),
          clockwise: false, radius: Radius.circular(40))
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height);

    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
