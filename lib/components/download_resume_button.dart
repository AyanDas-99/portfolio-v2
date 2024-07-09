import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_1/state/resume/get_resume_repository.dart';
import 'dart:developer' show log;

import 'package:portfolio_1/state/utils/launch_url.dart';

class DownloadResumeBtn extends StatefulWidget {
  const DownloadResumeBtn({super.key});

  @override
  State<DownloadResumeBtn> createState() => _DownloadResumeBtnState();
}

class _DownloadResumeBtnState extends State<DownloadResumeBtn> {
  bool hovering = false;
  bool loading = false;

  downloadResume() async {
    loading = true;
    setState(() {});
    final url = await GetResumeRepository().getResumeDownloadUrl();
    if (url == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
                child: Text(
              "Resume not available at the moment",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
            )),
            backgroundColor: Colors.redAccent.shade700.withAlpha(100),
          ),
        );
      }
    } else {
      launchLink(url);
    }
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          hovering = false;
        });
      },
      child: GestureDetector(
        onTap: downloadResume,
        child: AnimatedContainer(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade500,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: hovering ? Offset.zero : const Offset(-6, 6),
                )
              ]),
          duration: const Duration(milliseconds: 200),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Resume",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.black)),
                    const SizedBox(width: 10),
                    const Icon(
                      CupertinoIcons.cloud_download,
                      color: Colors.black,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
