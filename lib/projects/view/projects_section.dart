import 'package:flutter/material.dart';
import 'package:portfolio_1/projects/providers/projects_provider.dart';
import 'package:provider/provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects'),
          const SizedBox(height: 50),
          Consumer<ProjectsProvider>(
              builder: (context, projectsProvider, child) {
            if (projectsProvider.projects == null) {
              return CircularProgressIndicator();
            }
            return Column(
                children: projectsProvider.projects!
                    .map((project) => Text(project.toString()))
                    .toList());
          }),
        ],
      ),
    );
  }
}
