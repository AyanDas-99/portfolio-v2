import 'package:flutter/material.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/theme/custom_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final techstack = [
      {
        'image': 'assets/images/dart.png',
        'name': 'Dart',
      },
      {
        'image': 'assets/images/flutter.png',
        'name': 'Flutter',
      },
      {
        'image': 'assets/images/html.png',
        'name': 'HTML',
      },
      {
        'image': 'assets/images/css.png',
        'name': 'CSS',
      },
      {
        'image': 'assets/images/js.png',
        'name': 'JS',
      },
      {
        'image': 'assets/images/git.png',
        'name': 'Git',
      },
      {
        'image': 'assets/images/github-mark-white.png',
        'name': 'Github',
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '.../About me ...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 50),
          Center(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: CustomTheme.lightGrey),
                children: const [
                  TextSpan(text: "Hello, I'm "),
                  TextSpan(
                      text: "Ayan, ",
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      )),
                  TextSpan(text: "a"),
                  TextSpan(
                      text: " Flutter Developer ",
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      )),
                  TextSpan(
                    text: "from India.\n",
                  ),
                  TextSpan(text: "Welcome to my portfolio 😄"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 70),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          spacing: 40,
                          runSpacing: 20,
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            ...techstack.map(
                              (tech) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(tech['image'] as String,
                                        height: 50),
                                    Text(
                                      tech['name'] as String,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Front-end',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black)),
                            const SizedBox(height: 10),
                            Text('Flutter',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: CustomTheme.lightGrey, width: 0.1)),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Back-end',
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 10),
                            Text('MongoDB / Firebase / MySQL',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: CustomTheme.lightGrey, width: 0.1)),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Favourite packages',
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 10),
                            Text('Riverpod / flutter_animate',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/profile.webp',
                      width: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          if (!Responsive.isDesktop(context))
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/profile.webp',
                      width: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: CustomTheme.lightGrey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        ...techstack.map(
                          (tech) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(tech['image'] as String, height: 50),
                                Text(
                                  tech['name'] as String,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Front-end',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black)),
                        const SizedBox(height: 10),
                        Text('Flutter',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: CustomTheme.lightGrey, width: 0.1)),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Back-end',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        Text('MongoDB / Firebase / MySQL',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: CustomTheme.lightGrey, width: 0.1)),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Favourite packages',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        Text('Riverpod / flutter_animate',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}
