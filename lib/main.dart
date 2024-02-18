import 'package:flutter/material.dart';
import 'package:widget_wizards/NavBar.dart';
import 'package:widget_wizards/view/donate.dart';
import 'package:widget_wizards/view/timepass.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NavBar()));
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
