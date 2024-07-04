import 'package:flutter/material.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/theme/custom_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.goToProjects});
  final VoidCallback goToProjects;

  @override
  Widget build(BuildContext context) {
    final socials = [
      {
        'title': 'Github',
        'icon': 'assets/images/github_icon.png',
        'icon1': 'assets/images/github-mark-white.png'
      },
      {
        'title': 'X',
        'icon': 'assets/images/x_logo-black.png',
        'icon1': 'assets/images/x_logo-white.png'
      },
      {
        'title': 'LinkedIn',
        'icon': 'assets/images/linkedin_smaller.png',
        'icon1': 'assets/images/linkedin_smaller.png',
      },
    ];

    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Responsive.isDesktop(context)
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile App',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: size.width * 0.1),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                          onPressed: goToProjects,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 7,
                            ),
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
                              .copyWith(fontSize: size.width * 0.1),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 7,
                            ),
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
                  ],
                ),
          const SizedBox(height: 50),
          SizedBox(
            width: size.width,
            child: Wrap(
              alignment: Responsive.isMobile(context) ? WrapAlignment.start : WrapAlignment.center,
              spacing: 50,
              runSpacing: 20,
              children: socials
                  .map((social) => InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: CustomTheme.lightGrey, width: 0.1)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                social['icon1'] as String,
                                width: 30,
                              ),
                              const SizedBox(width: 20),
                              Text(social['title'] as String, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontStyle: FontStyle.italic),),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
