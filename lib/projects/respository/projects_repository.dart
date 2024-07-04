import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_1/projects/models/project.dart';

class ProjectRepository {
  Future<List<Project>> getProjects() async {
    await Future.delayed(Duration(seconds: 4));
    try {
      final result =
          await FirebaseFirestore.instance.collection('projects').get();
      return result.docs.map((doc) => Project.fromMap(doc.data())).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
