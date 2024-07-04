import 'package:flutter/material.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/state/theme/theme_mode_provider.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.tabs, required this.keys, required this.tab});
  final List<Map> tabs;
  final List<GlobalKey> keys;
  final int tab;

  void scroll(GlobalKey key) async {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leadingWidth: 180,
      centerTitle: true,
      leading: Center(
        child: (widget.tab != 0)
            ? Image.asset(
                'assets/images/personal_brand_white.png',
                height: 50,
              )
            : Text(
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
                  widget.tabs.length,
                  (index) => Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () => widget.scroll(widget.keys[index + 1]),
                      child: Text(
                        widget.tabs[index]['title'],
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color:
                                widget.tab == index + 1 ? Colors.white : null),
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
                Provider.of<ThemeModeProvider>(context, listen: false).toggle();
              },
              icon: Provider.of<ThemeModeProvider>(context).mode ==
                      ThemeMode.light
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode))
      ],
    );
  }
}
