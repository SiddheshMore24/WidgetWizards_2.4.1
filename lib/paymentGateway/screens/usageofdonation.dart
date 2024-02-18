import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:widget_wizards/view/donate.dart';
import 'dart:ui';
import 'package:widget_wizards/view/transaction.dart';








class UsageOfDonation extends StatelessWidget {
  // UsageOfDonation({Key key, this.title}) : super(key: key);
   UsageOfDonation({super.key, required this.donation});

   DonationModel donation = DonationModel(title: "", date: DateTime.now(), amount: 0);
   // Static member
  // static String getTitle(DonationModel donation) {
  //   return donation.title;
  // }

  static String title = "project title";
  static String amount = "Amount Paid -> Rs. 500";
  static String category= "Category -> Food";

  List<DonationModel> donations = [
  DonationModel(title: 'Donated for earthquake relief', date: DateTime.now(), amount: 500),
  DonationModel(title: 'Donated for flood victims', date: DateTime.now().subtract(Duration(days: 2)), amount: 1000),
  DonationModel(title: 'Donated for wildfire recovery', date: DateTime.now().subtract(Duration(days: 5)), amount: 750),
  // Add more donations as needed
];

List<String> process = [
 title, amount, category
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Status"),
      ),
      body: Timeline.tileBuilder(

        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              // ignore: avoid_unnecessary_containers
              child: Container(
                width: 120,
                height: 100,
                child: Card(
                elevation: 3,
                child: Text( process[index]),),),)
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}