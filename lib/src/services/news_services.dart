import 'package:fl_news/src/models/category_models.dart';
import 'package:fl_news/src/models/news_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = '670fcd4531d8432eae1579dd0661ad77';
const _COUNTRY = 'mx';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  final List<Category> categoryNews = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    categoryNews.forEach((item) {
      this.categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    getArticleByCategory(valor);

    notifyListeners();
  }

  List<Article>? get getPostArticleCategory =>
      this.categoryArticles[selectedCategory];

  getTopHeadlines() async {
    const url = ('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=$_COUNTRY');
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }

  getArticleByCategory(String category) async {
    if (categoryArticles[category]!.length > 0 ||
        categoryArticles[category]!.isNotEmpty) {
      return this.categoryArticles[category];
    }

    final url =
        ('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=$_COUNTRY&category=$category');

    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();
  }
}
