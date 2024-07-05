import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_1/theme/custom_theme.dart';
import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

class YoutubeView extends StatefulWidget {
  const YoutubeView({super.key, required this.video, required this.title});
  final String video;
  final String title;

  @override
  State<YoutubeView> createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(widget.title, (int id) {
      final iframe = web.HTMLIFrameElement()
        ..width = '100'
        ..height = '50'
        ..src = widget.video
        ..style.border = 'none';

      iframe.onLoad.listen((event) {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      });

      return iframe;
    });

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          HtmlElementView(
            viewType: widget.title,
          ),
          if (isLoading)
            Center(
              child: Container(color: CustomTheme.darkGrey)
                  .animate(
                      onPlay: (controller) => controller.repeat(reverse: true))
                  .fade(
                      duration: const Duration(milliseconds: 700),
                      begin: 0.4,
                      end: 0.1),
            )
        ],
      ),
    );
  }
}
