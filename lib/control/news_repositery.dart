import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:widget_wizards/model/newsHeadlineModel.dart';

class NewsRepositry{
  Future<NewsHeadlineModel>fetchHeadline()async{
    String url='https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=c1e6df5e095847ddbe3bc6e6d44b7ca0';
    final response =await http.get(Uri.parse(url));
    if (response.statusCode==200)
    {
      final body = jsonDecode(response.body);
      return NewsHeadlineModel.fromJson(body);
    }else{
      throw Exception('error');
    }
  }

}