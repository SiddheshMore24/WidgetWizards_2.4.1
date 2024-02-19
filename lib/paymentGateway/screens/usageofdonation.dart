import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:widget_wizards/model/user.dart';
import 'package:widget_wizards/view/donate.dart';
import 'dart:ui';
import 'package:widget_wizards/view/transaction.dart';
import 'package:widget_wizards/model/user.dart';







class UsageOfDonation extends StatelessWidget {
  // UsageOfDonation({Key key, this.title}) : super(key: key);
   UsageOfDonation({super.key,required this.amount, required this.title});

   
 
   // Static member
  // static String getTitle(DonationModel donation) {
  //   return donation.title;
  // }
  final String title ;
  
  final String amount ;
  // final String category;

  List<DonationModel> donations = [
  DonationModel(title: 'Donated for earthquake relief', date: DateTime.now(), amount: 500),
  DonationModel(title: 'Donated for flood victims', date: DateTime.now().subtract(Duration(days: 2)), amount: 1000),
  DonationModel(title: 'Donated for wildfire recovery', date: DateTime.now().subtract(Duration(days: 5)), amount: 750),
  // Add more donations as needed
];


  @override
  Widget build(BuildContext context) {
    List<String> process = [
  title, amount
];

    return Scaffold(
      appBar: AppBar(
        title: Text("Track Status"),
        backgroundColor: Colors.teal,
      ),
      body: Timeline.tileBuilder(
      theme: TimelineThemeData(
        color: Colors.teal
      ),
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              // ignore: avoid_unnecessary_containers
              child: Container(
                width: 140,
                height: 60, 
                alignment: Alignment.center,           
                child: Text( process[index]),),)
          ),
          itemCount: 2,
        ),
      ),
    );
  }
}