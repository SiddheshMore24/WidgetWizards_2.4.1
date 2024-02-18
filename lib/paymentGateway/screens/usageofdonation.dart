import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'dart:ui';






class UsageOfDonation extends StatefulWidget {
  // UsageOfDonation({Key key, this.title}) : super(key: key);
  const UsageOfDonation({super.key});

  

  @override
  _UsageOfDonationState createState() => _UsageOfDonationState();
}

class _UsageOfDonationState extends State<UsageOfDonation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uses of Donations"),
      ),
      body: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.reverse,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Timeline Event $index'),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}