import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  DonorList({required this.title});

  @override
  State<DonorList> createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  var errorMessage = '';
  List<Users> donorList = [];

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
          if (user.title == widget.title) {
            setState(() {
              donorList.add(user);
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
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Donor List', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: errorMessage.isNotEmpty
          ? Center(
              child: Text(errorMessage),
            )
          : donorList.isEmpty
              ? Center(
                  child: Text('No data available'),
                )
              : ListView.builder(
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
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
