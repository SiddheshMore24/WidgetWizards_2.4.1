import 'package:flutter/material.dart';

// Donation model class
class DonationModel {
  final String title;
  final DateTime date;
  final double amount;

  DonationModel({required this.title, required this.date, required this.amount});
}

// Dummy list of donations for testing
List<DonationModel> donations = [
  DonationModel(title: 'Donated for earthquake relief', date: DateTime.now(), amount: 500),
  DonationModel(title: 'Donated for flood victims', date: DateTime.now().subtract(Duration(days: 2)), amount: 1000),
  DonationModel(title: 'Donated for wildfire recovery', date: DateTime.now().subtract(Duration(days: 5)), amount: 750),
  // Add more donations as needed
];

// Donation widget
class Transaction extends StatelessWidget {
  const Transaction({Key? key});

  final title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donations"),
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
                      builder: (context) => DonationDetailsPage(donation: donations[index]),
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
                              'Date: ${donations[index].date.toString()}',
                              style: TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
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