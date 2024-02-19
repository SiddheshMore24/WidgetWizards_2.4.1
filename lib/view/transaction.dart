import 'package:flutter/material.dart';
import 'package:widget_wizards/paymentGateway/screens/usageofdonation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../organization/DonarList.dart';
// Donation model class
class DonationModel {
  final String title;
  final DateTime date;
  final double amount;

  DonationModel({required this.title, required this.date, required this.amount});
}



// Dummy list of donations for testing



// Donation widget
class Transaction extends StatefulWidget {
  Transaction({super.key,required this.users});
Users users;
  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {

  List<Users> donations = [];

  void initState() {
    super.initState();
    loadScreen();
  }

  var errorMessage;

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
        print(response.body);
        final Map<String, dynamic> list = json.decode(response.body);
        list.forEach((key, value) {
          Users user = Users(
            title: value['title'],
            name: value['name'],
            amount: value['amount'],
          );
          String name = widget.users.name == "" ? "Siddhesh" : widget.users.name;
          if (widget.users.name
              .contains(user.name)) {
            setState(() {
              donations.add(user);
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
        title: Text("Transaction History"),
        backgroundColor: Colors.teal, // Change app bar color
      ),
      body: Container(
        color: Colors.grey[200], // Change background color
        child: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (context, index) {
            return Material( // Wrap Card with Material
              color: Colors.transparent, // Set transparent background color
              child: InkWell( // InkWell for onTap behavior
                onTap: () {
                  // Navigate to donation details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsageOfDonation(title: donations[index].title,amount: donations[index].amount.toStringAsFixed(2),),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          donations[index].title,
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
                        SizedBox(height: 8.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Amount: ₹${donations[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Donation details page
class DonationDetailsPage extends StatelessWidget {
  final DonationModel donation;

  DonationDetailsPage({required this.donation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donation Details"),
        backgroundColor: Colors.teal, // Change app bar color
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200], // Change background color
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Title:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(donation.title),
              ),
              ListTile(
                title: Text(
                  'Date:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(donation.date.toString()),
              ),
              ListTile(
                title: Text(
                  'Amount:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('₹${donation.amount.toStringAsFixed(2)}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}