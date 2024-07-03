import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_1/components/custom_appbar.dart';
import 'package:portfolio_1/components/custom_drawer.dart';
import 'package:portfolio_1/hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();

  int tab = 0;
  final List<Map> tabs = [
    {'title': 'About'},
    {'title': 'Projects'},
    {'title': 'Articles'},
    {'title': 'Contact'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(tabs: tabs, controller: controller, tab: tab),
      appBar: CustomAppbar(tabs: tabs, controller: controller, tab: tab),
      body: ExpandablePageView(
        scrollDirection: Axis.vertical,
        alignment: Alignment.topCenter,
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
              color: Colors.blueGrey.shade900,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      tabs[index]['title'],
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

