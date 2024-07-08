import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:portfolio_1/components/network_image.dart';
import 'package:portfolio_1/components/youtube_view.dart';
import 'package:portfolio_1/projects/models/project.dart';
import 'package:portfolio_1/responsive/responsive.dart';
import 'package:portfolio_1/state/utils/launch_url.dart';
import 'package:portfolio_1/theme/custom_theme.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key, required this.project, required this.reversed});
  final Project project;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Responsive.isDesktop(context) ? Row(
        textDirection:reversed ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 30),
                Wrap(
                  children: project.concepts
                      .map((concept) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: CustomTheme.lightGrey, width: 0.1)),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              concept,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 50),
                HtmlWidget(
                  project.description,
                  textStyle: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: CustomTheme.lightGrey,
                        radius: 31,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: TextButton(
                              onPressed: () {
                                launchLink(project.github);
                              },
                              child: Image.asset(
                                "assets/images/github-mark-white.png",
                                fit: BoxFit.contain,
                              )),
                        )),
                    const SizedBox(width: 10),
                    if (project.live != null)
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () => launchLink(project.live!),
                          icon: const Icon(Icons.arrow_outward),
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          // Media
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (project.videos.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: YoutubeView(
                      video: project.videos.first,
                      title: project.title,
                    ),
                  ),
                if (project.videos.isEmpty && project.images.isNotEmpty)
                  NetworkImageView(url: project.images.first),
                const SizedBox(height: 40),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (project.videos.isEmpty && project.images.isNotEmpty)
                        ...project.images.sublist(1).map((image) =>
                            Expanded(child: NetworkImageView(url: image))),
                      if (project.videos.isNotEmpty)
                        ...project.images.map((image) =>
                            Expanded(child: NetworkImageView(url: image))),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ) : Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 30),
              Wrap(
                children: project.concepts
                    .map((concept) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: CustomTheme.lightGrey, width: 0.1)),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            concept,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 50),
              HtmlWidget(
                project.description,
                textStyle: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  CircleAvatar(
                      backgroundColor: CustomTheme.lightGrey,
                      radius: 31,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/github-mark-white.png",
                              fit: BoxFit.contain,
                            )),
                      )),
                  const SizedBox(width: 10),
                  if (project.live != null)
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_outward),
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          // Media
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (project.videos.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: YoutubeView(
                    video: project.videos.first,
                    title: project.title,
                  ),
                ),
              if (project.videos.isEmpty && project.images.isNotEmpty)
                NetworkImageView(url: project.images.first),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (project.videos.isEmpty && project.images.isNotEmpty)
                    ...project.images.sublist(1).map((image) =>
                        Expanded(child: NetworkImageView(url: image))),
                  if (project.videos.isNotEmpty)
                    ...project.images.map((image) =>
                        Expanded(child: NetworkImageView(url: image))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProjectViewLoading extends StatelessWidget {
  const ProjectViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 700),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(color: CustomTheme.darkGrey))),
          const SizedBox(width: 50),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(color: CustomTheme.darkGrey),
              ),
              const SizedBox(height: 50),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(color: CustomTheme.darkGrey),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Container(color: CustomTheme.darkGrey),
                  ),
                ],
              )),
            ],
          )),
        ],
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .fade(
          begin: 0.3,
          end: 0.1,
          duration: const Duration(milliseconds: 700),
          curve: Curves.ease,
        );
  }
}
