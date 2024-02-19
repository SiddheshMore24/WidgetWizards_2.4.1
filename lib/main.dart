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

  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: AuthScreen2(),
    );
  }
}
