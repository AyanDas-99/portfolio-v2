import 'dart:math' show min;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white)),
                      onPressed: goToProjects,
                      child: Text(
                        'Projects',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          color: Colors.black,
                          onPressed: goToProjects,
                          icon: const Icon(Icons.arrow_forward)),
                    ),
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
                Row(
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white)),
                      onPressed: goToProjects,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: 7,
                        ),
                        child: Text(
                          'Projects',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontSize: min(size.width * 0.05, 25)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: min(30, size.width * 0.06),
                      backgroundColor: Colors.white,
                      child: IconButton(
                          color: Colors.black,
                          onPressed: goToProjects,
                          icon: const Icon(Icons.arrow_forward)),
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 50),
          SocialLinks(size: size)
        ],
      ),
    ).animate().scaleY(delay: 1.seconds, duration: 1.seconds, curve: Curves.fastLinearToSlowEaseIn);
  }
}
