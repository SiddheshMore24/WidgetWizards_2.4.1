import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

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
