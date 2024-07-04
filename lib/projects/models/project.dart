import 'dart:convert';
import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String title;
  final String description;
  final List<String>? images;
  final List<String>? videos;
  final String live;
  final String github;
  final List<String> concepts;

  const Project(
      {required this.title,
      required this.description,
      required this.images,
      required this.videos,
      required this.live,
      required this.github,
      required this.concepts});

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
        title: map['title'] as String,
        description: map['description'] as String,
        images: map['images'] != null
            ? List<String>.from((map['images'] as List<dynamic>))
            : null,
        videos: map['videos'] != null
            ? List<String>.from((map['videos'] as List<dynamic>))
            : null,
        live: map['live'] as String,
        github: map['github'] as String,
        concepts: List<String>.from(
          (map['concepts'] as List<dynamic>),
        ));
  }

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(title: $title, description: $description, images: $images, videos: $videos, live: $live, github: $github, concepts: $concepts)';
  }

  @override
  List<Object?> get props => [title, description, images, videos, live, github];
}
