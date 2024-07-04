import 'package:flutter/material.dart';
import 'package:portfolio_1/components/custom_appbar.dart';
import 'package:portfolio_1/components/custom_drawer.dart';
import 'package:portfolio_1/projects/view/projects_section.dart';
import 'package:portfolio_1/sections/about_section.dart';
import 'package:portfolio_1/sections/hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();

  int tab = 0;
  late List<Map> tabs;
  final keys = List.generate(5, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();

    tabs = [
      {'title': 'About', 'screen': AboutSection(key: keys[1])},
      {'title': 'Projects', 'screen': ProjectsSection(key: keys[2])},
      {'title': 'Articles', 'screen': AboutSection(key: keys[3])},
      {'title': 'Contact', 'screen': AboutSection(key: keys[4])},
    ];

    controller.addListener(_onScroll);
  }

  void _onScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    for (int i = 0; i < keys.length; i++) {
      RenderObject? renderObject = keys[i].currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        double widgetPosition = renderObject.localToGlobal(Offset.zero).dy;
        double pageHeight = MediaQuery.of(context).size.height;
        if (widgetPosition <= pageHeight/2) {
          setState(() {
            tab = i;
          });
        }
      }
    }
  }

  void scroll(GlobalKey key) async {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
          tabs: tabs, controller: controller, tab: tab, keys: keys),
      appBar: CustomAppbar(
        tabs: tabs,
        keys: keys,
        tab: tab,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            HeroSection(
              goToProjects: () => scroll(keys[2]),
              key: keys[0],
            ),
            ...tabs.map((tab) => tab['screen']),
          ],
        ),
      ),
    );
  }
}
