import 'package:flutter/material.dart';
import 'package:widget_wizards/paymentGateway/razorpay_payment.dart';
import 'package:widget_wizards/view/payment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define a class to represent a calamity
class Calamity {
  final String title;
  final String description;

  Calamity({required this.title, required this.description});
}

class Donation extends StatefulWidget {
  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  List<Calamity> calamities = [];
  var errorMessage;

  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  void loadScreen() async {
    final url = Uri.https(
        "widgetwizards-c50c8-default-rtdb.firebaseio.com", 'crises.json');
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          errorMessage = "Failed to fetch data";
        });
      } else {
        final Map<String, dynamic> list = json.decode(response.body);
        list.forEach((key, value) {
          Calamity calamity = Calamity(
            title: value['title'],
            description: value['description'],
          );
          print(response.body);
          if (!calamities.contains(calamity)) {
            setState(() {
              calamities.add(calamity);
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
        title: Text('Awareness'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: calamities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: InkWell(
              onTap: () {
                // Navigate to the detail page when a calamity is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CalamityDetailPage(calamity: calamities[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
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
                    calamities[index].title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal, // Change the color as per your design
                    ),
                  ),
                  subtitle: Text(
                    calamities[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
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

class CalamityDetailPage extends StatelessWidget {
  final Calamity calamity;

  CalamityDetailPage({required this.calamity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Calamity Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      calamity.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      calamity.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RazorpayPage(
                                Title: calamity.title,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary:Colors.teal,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'Donate',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
