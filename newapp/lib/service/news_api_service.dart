import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/models/news_model.dart';

class NewsApiService {
  static Future<List<Articles>> fetchNewsData(
      {required int page, required String sortBy}) async {
    List<Articles> newslist = [];
    try {
      var link =
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=253345f23ddf4afebc7882dbf7b0db63&page=$page&sortBy=$sortBy";
      var response = await http.get(Uri.parse(link));
      var data = jsonDecode(response.body);

      Articles articles;

      for (var i in data['articles']) {
        articles = Articles.fromJson(i);
        newslist.add(articles);
      }
    } catch (e) {
      print(e);
    }
    return newslist;
  }

  static Future<List<Articles>> fetchSearchData({required String query}) async {
    List<Articles> searchList = [];

    try {
      var link =
          "https://newsapi.org/v2/everything?q=$query&apiKey=253345f23ddf4afebc7882dbf7b0db63";
      var response = await http.get(Uri.parse(link));
      print(response.body);
      var data = jsonDecode(response.body);
      Articles articles;
      for (var i in data['articles']) {
        articles = Articles.fromJson(i);
        searchList.add(articles);
      }
    } catch (e) {
      print("the problem is $e");
    }
    return searchList;
  }
}
