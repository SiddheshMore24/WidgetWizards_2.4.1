import 'package:flutter/material.dart';
import 'package:widget_wizards/view/donate.dart';
import 'package:widget_wizards/view/news.dart';
import 'package:widget_wizards/view/transaction.dart';
import 'package:widget_wizards/view/userProfile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  void selectItem(int idx) {
    setState(() {
      index = idx;
    });
  }

  List<Widget> list = [
    News(),
    Donate(),
    Transaction(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget content = list[index];
    return Scaffold(
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectItem,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fireplace_outlined,
                color: index == 0 ? Colors.blue : Colors.grey,
              ),
              label: "News"),
          BottomNavigationBarItem(
            icon:
            Icon(color: index == 1 ? Colors.blue : Colors.grey, Icons.monetization_on_outlined),
            label: "Donation",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  color: index == 2 ? Colors.blue : Colors.grey,
                  Icons.history),
              label: "Transaction"),
          BottomNavigationBarItem(
              icon: Icon(
                  color: index == 3 ? Colors.blue : Colors.grey,
                  Icons.account_circle_rounded),
              label: "Profile"),
        ],
      ),

    );
  }
}
