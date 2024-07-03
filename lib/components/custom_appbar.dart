import 'package:flutter/material.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/state/theme/theme_mode_provider.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key, required this.tabs, required this.controller, required this.tab});
  final List<Map> tabs;
  final PageController controller;
  final int tab;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
        leadingWidth: 180,
        // toolbarHeight: 100,
        centerTitle: true,
        leading: Center(
          child: Text(
            'Ayan Das',
            softWrap: true,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        title: (Responsive.isMobile(context))
            ? null
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Responsive.isDesktop(context))
                    const Spacer(
                      flex: 3,
                    ),
                  ...List.generate(
                    tabs.length,
                    (index) => Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          controller.animateToPage(index + 1,
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: Text(
                          tabs[index]['title'],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      tab == index + 1 ? Colors.white : null),
                        ),
                      ),
                    ),
                  ),
                  if (Responsive.isDesktop(context))
                    const Spacer(
                      flex: 3,
                    ),
                ],
              ),
        actions: [
          if (Responsive.isMobile(context))
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
          if (!Responsive.isMobile(context))
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
      );
  }
  
  @override
  Size get preferredSize => AppBar().preferredSize;
}