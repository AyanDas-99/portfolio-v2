import 'package:flutter/material.dart';
import 'package:portfolio_1/components/download_resume_button.dart';
import 'package:portfolio_1/home_page.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.tabs,
    required this.keys,
  });

  final List<Map> tabs;
  final List<GlobalKey> keys;

  void scroll(GlobalKey key) async {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shadowColor: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ayan.Das',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
              ],
            ),
            const Spacer(),
            ...List.generate(
              tabs.length,
              (index) => Expanded(
                child: ListTile(
                  onTap: () => scroll(keys[index + 1]),
                  title: Consumer<VisibleTabProvider>(
                      builder: (context, visibleTab, child) {
                    return Text(
                      tabs[index]['title'],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: visibleTab.tab == index + 1
                              ? Colors.white
                              : null),
                    );
                  }),
                ),
              ),
            ),
            const Spacer(),
            const DownloadResumeBtn(),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
