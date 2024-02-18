import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  TransactionHistory({Key? key, this.project, this.amount}) : super(key: key);

  final project;
  final amount;
  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Donations"),),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Text("Widget Wizard"),
                Text("Rs. 5000"),
                Text("28-Feb-2024"),
              ],
            ),
          ),

          Card(
            child: Column(
              children: [
                Text("6 bits"),
                Text("Rs. 2000"),
                Text("22-jan-2024"),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
