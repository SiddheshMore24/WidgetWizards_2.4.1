import 'dart:io';

class Crises {
  File? image;
  final String title;
  final String location;
  final String description;
  final String totalInjured;
  final String totalDeaths;
  final String date;

  Crises({
    required this.image,
    required this.title,
    required this.location,
    required this.description,
    required this.totalDeaths,
    required this.totalInjured,
    required this.date,
  });
}
