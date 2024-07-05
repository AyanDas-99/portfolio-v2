import 'package:flutter/material.dart';
import 'package:portfolio_1/home_page.dart';
import 'package:portfolio_1/projects/providers/projects_provider.dart';
import 'package:portfolio_1/state/theme/theme_mode_provider.dart';
import 'package:portfolio_1/theme/custom_theme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModeProvider()),
        ChangeNotifierProvider(create: (context) => ProjectsProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<ProjectsProvider>().loadProjects();
    return Consumer<ThemeModeProvider>(builder: (context, thememode, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        darkTheme: CustomTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: thememode.mode,
        home: const HomePage(),
      );
    });
  }
}


// Adding new project

// Directly add new project data in firestore
// Check previous projects in firestore or lib/projects/models to get the schema
// In the videos list, the video should be an embed src link from youtube
