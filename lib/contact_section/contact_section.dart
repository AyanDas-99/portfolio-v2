import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_1/components/social_links.dart';
import 'package:portfolio_1/home_page.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<VisibleTabProvider>(builder: (context, visibleTab, child) {
      return Container(
        constraints: BoxConstraints(minHeight: size.height),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('... / Contacts ...',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 50),
            Flex(
              direction: Responsive.isDesktop(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayan Das',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: size.width * 0.09),
                    ),
                    if (Responsive.isDesktop(context))
                      const SizedBox(height: 50),
                    if (!Responsive.isDesktop(context))
                      const SizedBox(height: 30),
                    const Text('Mobile App\nDeveloper')
                  ],
                ),
                if (Responsive.isDesktop(context)) const SizedBox(width: 100),
                if (!Responsive.isDesktop(context)) const SizedBox(height: 50),
                Flexible(
                  flex: Responsive.isDesktop(context) ? 1 : 0,
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.2, color: CustomTheme.lightGrey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created by ME /',
                          style: Theme.of(context).textTheme.bodySmall,
                          softWrap: true,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Inspired from Taisia Tsyganok (behance) /',
                          style: Theme.of(context).textTheme.bodySmall,
                          softWrap: true,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Powered by Flutter 💙 /',
                          style: Theme.of(context).textTheme.bodySmall,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SocialLinks(size: size),
          ],
        ),
      )
          .animate(target: visibleTab.tab == 3 ? 1 : 0)
          .fadeIn(duration: 1.seconds, curve: Curves.ease);
    });
  }
}
