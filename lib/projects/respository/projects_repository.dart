import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_1/projects/models/project.dart';
import 'dart:developer' as dev;

class ProjectRepository {
  Future<List<Project>> getProjects() async {
    try {
      final result =
          await FirebaseFirestore.instance.collection('projects').get();
      return result.docs.map((doc) => Project.fromMap(doc.data())).toList();
    } catch (e) {
      dev.log( 'Error with getProjects()',error:e);
      return [];
    }
  }
}
