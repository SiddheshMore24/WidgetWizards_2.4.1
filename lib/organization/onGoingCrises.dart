import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widget_wizards/organization/add_crises.dart';

import 'dart:convert';
import 'dart:io';

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
        title: Text('Calamities'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => AddCrises(
                          crises: Crises(
                            image: null, // Set image to null
                            title: '',
                            location: '',
                            description: '',
                            totalDeaths: '',
                            totalInjured: '',
                            date: '',
                          ),
                        )),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: onGoing.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: InkWell(
              onTap: () {
                // Navigate to the detail page when a calamity is tapped
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CalamityDetailPage(calamity: calamities[index]),
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    onGoing[index].title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Change the color as per your design
                    ),
                  ),
                  subtitle: Text(
                    onGoing[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  leading: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 36.0,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
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
