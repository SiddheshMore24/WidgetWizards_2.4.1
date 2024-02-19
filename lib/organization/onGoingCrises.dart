import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widget_wizards/organization/add_crises.dart';

import 'dart:convert';
import 'dart:io';
import 'package:widget_wizards/organization/DonarList.dart';
import 'package:widget_wizards/organization/crises.dart';
import 'package:widget_wizards/view/donate.dart';

class OnGoingCrises extends StatefulWidget {
  const OnGoingCrises({super.key});

  @override
  State<OnGoingCrises> createState() => _OnGoingCrisesState();
}

class _OnGoingCrisesState extends State<OnGoingCrises> {
  @override
  void initState() {
    loadScreen();
    super.initState();
  }

  var e = '';
  List<Crises> onGoing = [];


  void loadScreen() async {
    final url = Uri.https(
        "widgetwizards-c50c8-default-rtdb.firebaseio.com", 'crises.json');
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          e = "failed to fetch";
        });
      }
      if (response.body == "null") {
        setState(() {
          e = "no data added yet";
        });
      } else {
        final Map<String, dynamic> list = json.decode(response.body);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        for (final item in list.entries) {
          Crises crisis = Crises(
            title: item.value['title'],
            location: item.value['location'],
            description: item.value['description'],
            totalDeaths: item.value['totalDeath'],
            totalInjured: item.value['totalInjured'],
            date: item.value['date'],
          );
          setState(() {
            if(!onGoing.contains(crisis))
            onGoing.add(crisis);

          });

          print(crisis.title);
        }
      }
    } catch (error) {
      setState(() {
        e = error.toString();
      });
    }
    print(e);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing Crises',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal, // Change app bar color
        actions: [
          IconButton(
            onPressed: () {
              Crises temp = Crises(
                image: null, // Set image to null
                title: '',
                location: '',
                description: '',
                totalDeaths: '',
                totalInjured: '',
                date: '',
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => AddCrises(
                          crises: temp
                        )),

              );
              setState(() {
                onGoing.add(temp);
              });

            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: onGoing.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0), // Adjust padding
            child: InkWell(
              onTap: () {
                // Navigate to the detail page when a calamity is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonorList(
                      title: onGoing[index].title,
                      crises: onGoing[index],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4, // Add elevation for a shadow effect
                // Inside the ListView.builder, modify the ListTile as follows:

                child: ListTile(
                  title: Text(
                    onGoing[index].title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal, // Change the color as per your design
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location: ${onGoing[index].location}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4), // Add spacing between items
                      // Add spacing between items
                      Text(
                        'Total Deaths: ${onGoing[index].totalDeaths}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4), // Add spacing between items
                      Text(
                        'Total Injured: ${onGoing[index].totalInjured}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4), // Add spacing between items
                      Text(
                        'Date: ${onGoing[index].date}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  // leading: Icon(
                  //   Icons.error_outline,
                  //   color: Colors.red,
                  //   size: 36.0,
                  // ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
