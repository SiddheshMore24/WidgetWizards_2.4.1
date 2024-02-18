import 'package:flutter/material.dart';

import 'package:widget_wizards/NavBar.dart';
import 'package:widget_wizards/paymentGateway/screens/transactionhistory.dart';
import 'package:widget_wizards/paymentGateway/screens/usageofdonation.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Main Screen"),
            ),
            body: Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UsageOfDonation()));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => ClientProfile()));
                      },
                      child: Text("UserHomePage")),
                ],
              ),
            ),
          )),
    );
  }
}
