import 'package:flutter/material.dart';
import 'package:widget_wizards/view/donate.dart';
import 'package:widget_wizards/view/news.dart';
import 'package:widget_wizards/view/transaction.dart';
import 'package:widget_wizards/view/user_profile.dart';

import 'model/user.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  User user = User(
    name: 'John Doe',
    email: 'john.doe@example.com',
    phoneNumber: '+1 (123) 456-7890',
    address: '123 Main Street, City, Country',
  );

  void selectItem(int idx) {
    setState(() {
      index = idx;
    });
  }

  List<Widget> createList() {
    return [
      NewsPage(),
      Donation(),
      Transaction(),
      ProfilePage(user: user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = createList();

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
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_outlined,
              color: index == 1 ? Colors.blue : Colors.grey,
            ),
            label: "Donation",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: index == 2 ? Colors.blue : Colors.grey,
            ),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              color: index == 3 ? Colors.blue : Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

