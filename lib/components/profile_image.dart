import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  double _x = 0;
  double _y = 0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _x = event.localPosition.dx - 200;
            _y = event.localPosition.dy - 200;
          });
        },
        onExit: (event) {
          setState(() {
            _x = 0;
            _y = 0;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/profile.webp',
            width: 400,
            fit: BoxFit.contain,
          ),
        )
            .animate()
            .flipH(end: _x * 0.0001, duration: 3.seconds, delay: 1.seconds)
            .flipV(end: _y * 0.0001, duration: 3.seconds, delay: 1.seconds),
      ),
    );
  }
}
