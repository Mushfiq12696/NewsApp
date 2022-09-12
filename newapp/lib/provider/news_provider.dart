import 'package:flutter/material.dart';
import 'package:newapp/models/news_model.dart';
import 'package:newapp/service/news_api_service.dart';

class NewsProvider with ChangeNotifier {
  List<Articles> newslist = [];
  List<Articles> searchList = [];

  Future<List<Articles>> getNewsData(
      {required int page, required String sortBy}) async {
    newslist = await NewsApiService.fetchNewsData(page: page, sortBy: sortBy);
    return newslist;
  }

  Articles findByDate({String? date}) {
    Articles data =
        newslist.firstWhere((element) => element.publishedAt == date);
    return data;
  }

  Future<List<Articles>> getSearchData({required String query}) async {
    searchList = await NewsApiService.fetchSearchData(query: query);
    notifyListeners();
    return searchList;
  }
}