import 'package:flutter/material.dart';

import '../model/project.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donations"),
      ),
        body: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      projectList[index].description,
                      style: TextStyle(
                        fontSize: 18, // Increase font size
                        color: Colors.white, // Change text color to white
                        fontWeight: FontWeight.bold, // Add bold font weight
                      ),
                    ),
                    Text(
                      projectList[index].description,
                      style: TextStyle(
                        fontSize: 18, // Increase font size
                        color: Colors.white, // Change text color to white
                        // Add bold font weight
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },),
    );
  }
}

List<Project> projectList = [
  Project(
    headline: "Project 1",
    description: "Description of Project 1",
  ),
  Project(
    headline: "Project 2",
    description: "Description of Project 2",
  ),
  Project(
    headline: "Project 3",
    description: "Description of Project 3",
  ),
  // Add 20 more dummy projects
  Project(
    headline: "Project 4",
    description: "Description of Project 4",
  ),
  Project(
    headline: "Project 5",
    description: "Description of Project 5",
  ),
  Project(
    headline: "Project 6",
    description: "Description of Project 6",
  ),
  Project(
    headline: "Project 7",
    description: "Description of Project 7",
  ),
  Project(
    headline: "Project 8",
    description: "Description of Project 8",
  ),
  Project(
    headline: "Project 9",
    description: "Description of Project 9",
  ),
  Project(
    headline: "Project 10",
    description: "Description of Project 10",
  ),
  Project(
    headline: "Project 11",
    description: "Description of Project 11",
  ),
  Project(
    headline: "Project 12",
    description: "Description of Project 12",
  ),
  Project(
    headline: "Project 13",
    description: "Description of Project 13",
  ),
  Project(
    headline: "Project 14",
    description: "Description of Project 14",
  ),
  Project(
    headline: "Project 15",
    description: "Description of Project 15",
  ),
  Project(
    headline: "Project 16",
    description: "Description of Project 16",
  ),
  Project(
    headline: "Project 17",
    description: "Description of Project 17",
  ),
  Project(
    headline: "Project 18",
    description: "Description of Project 18",
  ),
  Project(
    headline: "Project 19",
    description: "Description of Project 19",
  ),
  Project(
    headline: "Project 20",
    description: "Description of Project 20",
  ),
];

