import 'dart:math' show min;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_1/components/download_resume_button.dart';
import 'package:portfolio_1/components/go_to_projects_btn.dart';
import 'package:portfolio_1/components/social_links.dart';
import 'package:portfolio_1/responsive/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.goToProjects});
  final VoidCallback goToProjects;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          if (Responsive.isDesktop(context))
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mobile App',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: size.width * 0.08),
                    ),
                    const Spacer(),

                    GoToProjectsBtn(goToProjects: goToProjects, size: size),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Text(
                        "I'm a developer, lifelong learner, and student with passion for crafting apps that make a difference in people's lives.",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      'Developer',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: size.width * 0.08),
                    ),
                  ],
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Mobile App',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: size.width * 0.13),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Developer',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: size.width * 0.13),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  "I'm a developer, lifelong learner, and student with passion for crafting apps that make a difference in people's lives.",
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 50),
                GoToProjectsBtn(goToProjects: goToProjects, size: size),

                const SizedBox(height: 50),
                if(Responsive.isMobile(context))
                const DownloadResumeBtn(),
              ],
            ),
          const SizedBox(height: 50),
          SocialLinks(size: size)
        ],
      ),
    ).animate().scaleY(
        delay: 1.seconds,
        duration: 1.seconds,
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
