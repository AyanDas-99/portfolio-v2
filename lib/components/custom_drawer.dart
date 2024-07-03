import 'package:flutter/material.dart';
import 'package:portfolio_1/state/theme/theme_mode_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.tabs,
    required this.controller,
    required this.tab,
  });

  final List<Map> tabs;
  final PageController controller;
  final int tab;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ayan.Das',
                    style: Theme.of(context).textTheme.displaySmall),
                IconButton(
                    onPressed: () {
                      Provider.of<ThemeModeProvider>(context, listen: false)
                          .toggle();
                    },
                    icon: Provider.of<ThemeModeProvider>(context).mode ==
                            ThemeMode.light
                        ? const Icon(Icons.light_mode)
                        : const Icon(Icons.dark_mode))
              ],
            ),
            const Spacer(),
            ...List.generate(
              tabs.length,
              (index) => Expanded(
                child: ListTile(
                  onTap: () {
                    controller.animateToPage(index + 1,
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  title: Text(
                    tabs[index]['title'],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: tab == index + 1 ? Colors.white : null),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
