import 'package:flutter/material.dart';
import 'package:portfolio_1/components/custom_appbar.dart';
import 'package:portfolio_1/components/custom_drawer.dart';
import 'package:portfolio_1/contact_section/contact_section.dart';
import 'package:portfolio_1/projects/view/projects_section.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/sections/about_section.dart';
import 'package:portfolio_1/sections/hero_section.dart';
import 'package:provider/provider.dart';

class VisibleTabProvider extends ChangeNotifier {
  int _tab = 0;

  int get tab => _tab;

  void update(int newTab) {
    _tab = newTab;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();

  int tab = 0;
  late List<Map> tabs;
  final keys = List.generate(4, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();

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
        if (widgetPosition <= pageHeight / 2) {
          context.read<VisibleTabProvider>().update(i);
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
    tabs = [
      {'title': 'About', 'screen': AboutSection(key: keys[1])},
      {'title': 'Projects', 'screen': ProjectsSection(key: keys[2])},
      {'title': 'Contact', 'screen': ContactSection(key: keys[3])},
    ];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/black_background.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child:Scaffold(
      drawer: CustomDrawer(tabs: tabs, keys: keys),
      appBar: CustomAppbar(tabs: tabs, keys: keys),
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: Responsive.isDesktop(context)
              ? const EdgeInsets.symmetric(horizontal: 100)
              : Responsive.isMobile(context)
                  ? const EdgeInsets.symmetric(horizontal: 25)
                  : const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              HeroSection(
                goToProjects: () => scroll(keys[2]),
                key: keys[0],
              ),
              const SizedBox(height: 100),
              ...tabs.map((tab) => tab['screen']),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    ) ,
    );
  }
}
