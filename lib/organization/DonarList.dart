import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'crises.dart';

class Users {
  final String name;
  final String title;
  final int amount;

  Users({
    required this.title,
    required this.name,
    required this.amount,
  });
}

class DonorList extends StatefulWidget {
  final String title;
  final Crises crises;

  DonorList({required this.title, required this.crises});

  @override
  State<DonorList> createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  var errorMessage = '';
  List<Users> donorList = [];
  int sum = 0;
  int dCount = 0;

  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  void loadScreen() async {
    final url = Uri.https(
        "widgetwizards-c50c8-default-rtdb.firebaseio.com", 'user.json');
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          errorMessage = "Failed to fetch data";
        });
      } else {
        final Map<String, dynamic> list = json.decode(response.body);
        list.forEach((key, value) {
          Users user = Users(
            title: value['title'],
            name: value['name'],
            amount: value['amount'],
          );
          if (widget.title.contains(user.title)) {
            setState(() {
              donorList.add(user);
              sum += user.amount;
              dCount++;
            });
          }
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = "Error: $error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var HeightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor List', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: HeightScreen * 0.4,
              child: Column(
                children: [
                  Container(
                    height: HeightScreen * 0.3,

                    child: widget.crises.image == null ? Image.asset('assets/apple.jpg',fit: BoxFit.cover,) : Image.file(widget.crises.image!,
                    fit: BoxFit.cover,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Donor Count : $dCount"),
                      SizedBox(width: 5,),
                      Text("Total Donation Available : Rs.$sum"),
                    ],
                  )
                ],
              ),
            ),
            errorMessage.isNotEmpty
                ? Center(
              child: Text(errorMessage),
            )
                : donorList.isEmpty
                ? Container(
              height: HeightScreen * 0.45,
              child: Center(
                child: Text('No data available'),
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: donorList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        donorList[index].name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text(
                        'Amount: ${donorList[index].amount}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: const Color.fromRGBO(0, 0, 0, 0.867),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}