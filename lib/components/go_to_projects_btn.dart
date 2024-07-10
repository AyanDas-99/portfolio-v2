import 'package:flutter/material.dart';
import 'dart:math' show min;

import 'package:flutter_animate/flutter_animate.dart';

class GoToProjectsBtn extends StatefulWidget {
  const GoToProjectsBtn(
      {super.key, required this.goToProjects, required this.size});
  final VoidCallback goToProjects;
  final Size size;

  @override
  State<GoToProjectsBtn> createState() => _GoToProjectsBtnState();
}

class _GoToProjectsBtnState extends State<GoToProjectsBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white)),
          onPressed: widget.goToProjects,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.09,
              vertical: 10,
            ),
            child: Text(
              'Projects',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: min(widget.size.width * 0.05, 25)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          radius: min(30, widget.size.width * 0.06),
          backgroundColor: Colors.white,
          child: IconButton(
              color: Colors.black,
              onPressed: widget.goToProjects,
              icon: const Icon(Icons.arrow_forward)),
        ).animate(onPlay: (controller) => controller.repeat(),).shakeX(hz: 2, amount: 5, delay: 1.seconds),
      ],
    );
  }
}
