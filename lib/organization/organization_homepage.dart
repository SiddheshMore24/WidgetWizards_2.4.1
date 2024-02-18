import 'package:flutter/material.dart';
import 'package:widget_wizards/organization/add_crises.dart';
import 'package:widget_wizards/organization/crises.dart';
import 'package:widget_wizards/organization/onGoingCrises.dart';

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
    return OnGoingCrises();
  }
}
