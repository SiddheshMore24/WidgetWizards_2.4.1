import 'package:flutter/material.dart';
<<<<<<< HEAD

class StepperDemo extends StatefulWidget {
  StepperDemo() : super();

  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}

class StepperDemoState extends State<StepperDemo> {
  //
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text('Step 1'),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('World!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Hello World!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Simple Stepper Demo"),
      ),
      // Body
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
=======
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
      ),
      body: Timeline.tileBuilder(

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
>>>>>>> ca64e563e00dad0f775e0daa9f15d5d1d8ab48ae
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> ca64e563e00dad0f775e0daa9f15d5d1d8ab48ae
