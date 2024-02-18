import 'package:flutter/material.dart';
import 'package:widget_wizards/control/news_repositery.dart';
import 'package:widget_wizards/model/newsHeadlineModel.dart';

class NewsViewModel{
  final _rep=NewsRepositry();

  Future<NewsHeadlineModel>fetchHeadline()
  async  {
    final response =await _rep.fetchHeadline();
    return response;
  }
}