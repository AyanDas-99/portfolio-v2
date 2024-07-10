import 'package:flutter/material.dart';
import 'package:portfolio_1/components/download_resume_button.dart';
import 'package:portfolio_1/home_page.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.tabs, required this.keys});
  final List<Map> tabs;
  final List<GlobalKey> keys;

  void scroll(GlobalKey key) async {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leadingWidth: 180,
      centerTitle: true,
      leading: Center(
        child: (context.watch<VisibleTabProvider>().tab != 0)
            ? Image.asset(
                'assets/images/personal_brand_white.webp',
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
                            color: context.watch<VisibleTabProvider>().tab ==
                                    index + 1
                                ? Colors.white
                                : null),
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
        if(Responsive.isMobile(context))
        IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: const Icon(Icons.menu))
        else 
        const DownloadResumeBtn(),
        const SizedBox(width: 20),
      ],
    );
  }
}
