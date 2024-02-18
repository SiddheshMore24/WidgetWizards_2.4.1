import 'dart:io';

class Crises {
  File? image;
   String title;
   String location;
   String description;
   String totalInjured;
   String totalDeaths;
   String date;

  Crises({
     this.image,
    required this.title,
    required this.location,
    required this.description,
    required this.totalDeaths,
    required this.totalInjured,
    required this.date,
  });
}
