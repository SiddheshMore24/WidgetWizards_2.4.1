import 'package:flutter/material.dart';
import 'package:widget_wizards/organization/add_crises.dart';
import 'package:widget_wizards/organization/crises.dart';

class OrganizationScreen extends StatefulWidget {
  OrganizationScreen({super.key});
  Crises crises = Crises(
    image: null, // Set image to null
    title: '',
    location: '',
    description: '',
    totalDeaths: '',
    totalInjured: '',
    date: '',
  ); 
  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Organization Name")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HonePage"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => (AddCrises(crises: widget.crises!))));
              },
              child: Text("Add Crises")),
        ],
      )),
    );
  }
}
