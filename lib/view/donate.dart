import 'package:flutter/material.dart';

void main() {
  runApp(Donate());
}

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Content & Donation'),
          ),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.5,
              margin: const EdgeInsets.all(8.0),
              child: CellWidget(
                imageUrl: 'assets/images/BlackClover.jpg',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dignissim massa euismod ipsum sollicitudin, id facilisis libero feugiat. Sed urna risus, semper in varius id, gravida aliquam lorem. Nunc tristique magna sed luctus rutrum. Proin hendrerit erat nec est luctus, vel rutrum odio posuere. Nunc a euismod dolor. Aenean consequat.',
              ),
            ),
          )
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  final String imageUrl;
  final String description;

  CellWidget({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle donate button press
                },
                child: const Text('Donate'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle learn more button press
                },
                child: const Text('Learn More'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




