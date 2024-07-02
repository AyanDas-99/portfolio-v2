import 'package:flutter/material.dart';
import 'package:portfolio_1/hero_section.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/state/theme/theme_mode_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();

  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map> tabs = [
      {'title': 'About'},
      {'title': 'Projects'},
      {'title': 'Articles'},
      {'title': 'Contact'},
    ];
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: size.width/2 * 0.08, vertical: 20),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 180,
          // toolbarHeight: 100,
          centerTitle: true,
          leading: Center(
            child: Text(
              'Ayan Das',
              softWrap: true,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(!Responsive.isMobile(context))
              const Spacer(flex: 3,),
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: tab == index + 1 ? Colors.white : null),
                    ),
                  ),
                ),
              ),

              if(!Responsive.isMobile(context))
             const Spacer(flex: 3,) ,
             
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<ThemeModeProvider>(context, listen: false).toggle();
                },
                icon: Provider.of<ThemeModeProvider>(context).mode ==
                        ThemeMode.light
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode))
          ],
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          pageSnapping: false,
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              tab = value;
            });
          },
          children: [
            HeroSection(
                goToProjects: () => controller.animateToPage(2,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastLinearToSlowEaseIn)),
            ...List.generate(tabs.length, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: double.maxFinite,
                child: Center(
                  child: Text(
                    tabs[index]['title'],
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
