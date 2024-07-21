import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_1/home_page.dart';
import 'package:portfolio_1/projects/providers/projects_provider.dart';
import 'package:portfolio_1/projects/view/project_view.dart';
import 'package:provider/provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VisibleTabProvider>(builder: (context, visibleTab, child) {
      return Container(
        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('... / Projects ...'),
            const SizedBox(height: 50),
            Consumer<ProjectsProvider>(
                builder: (context, projectsProvider, child) {
              if (projectsProvider.projects == null) {
                return const ProjectViewLoading();
              }
              return Column(
                children: List.generate(
                  projectsProvider.projects!.length,
                  (index) => ProjectView(
                    project: projectsProvider.projects![index],
                    reversed: index.isEven,
                  ),
                ),
              );
            }),
          ],
        ),
      )
          .animate(target: visibleTab.tab == 2 ? 1 : 0)
          .fadeIn(duration: 1.seconds, curve: Curves.ease);
    });
  }
}
