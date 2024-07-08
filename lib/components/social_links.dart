import 'package:flutter/material.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/state/user_details.dart';
import 'package:portfolio_1/state/utils/launch_url.dart';
import 'package:portfolio_1/theme/custom_theme.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Wrap(
        alignment: Responsive.isMobile(context)
            ? WrapAlignment.start
            : WrapAlignment.center,
        spacing: 50,
        runSpacing: 20,
        children: socials
            .map((social) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(color: CustomTheme.lightGrey, width: 0.1)),
                  child: InkWell(
                    onTap: () => launchLink(social['link'] as String),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          social['icon1'] as String,
                          width: 30,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          social['title'] as String,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
