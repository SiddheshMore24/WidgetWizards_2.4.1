import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:widget_wizards/NavBar.dart';
import 'package:widget_wizards/paymentGateway/screens/transactionhistory.dart';
import 'package:widget_wizards/paymentGateway/screens/usageofdonation.dart';
import 'package:widget_wizards/firebase_options.dart';
import 'package:widget_wizards/organization/organization_homepage.dart';
import 'package:widget_wizards/view/donate.dart';


import 'authentication/auth2.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(home: MyApp()));

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
                      ElevatedButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AuthScreen2()));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => ClientProfile()));
                      },
                      child: Text("Authentication")),
                        ElevatedButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>OrganizationScreen()));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => ClientProfile()));
                      },
                      child: Text("Organization Home Page")),
                ],
              ),
            ),
          )),
    );
  }
}
