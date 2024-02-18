import 'package:flutter/material.dart';
class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            'https://example.com/image.jpg', // Replace with actual image URL
            errorBuilder: (context, error, stackTrace) =>
                Text('Error loading image'),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Flood fury, raining misery\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Cloudburst in Sikkim triggers flash flood, displacing thousands. Landslides in Himachal add to the woes.',
                ),
              ],
            ),
          ),
          Text(
            'Source: PTI',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
