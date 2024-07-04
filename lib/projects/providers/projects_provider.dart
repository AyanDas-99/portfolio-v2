import 'package:flutter/material.dart';
import 'package:portfolio_1/projects/models/project.dart';
import 'package:portfolio_1/projects/respository/projects_repository.dart';

class ProjectsProvider extends ChangeNotifier {
  List<Project>? _projects;

  List<Project>? get projects => _projects;

  Future loadProjects() async {
    final projects = await ProjectRepository().getProjects();
    _projects = projects;
    notifyListeners();
  }
}