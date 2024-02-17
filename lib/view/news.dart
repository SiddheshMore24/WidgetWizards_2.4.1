import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: ListView.builder(
       itemCount: news.length,
       itemBuilder: (context, index) {

       return Text(news[index]);
     },),
    );
  }
}
List<String>news=[
  'first',
  'second',
  'third',
];