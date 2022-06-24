import 'package:fl_news/src/pages/tabs_page.dart';
import 'package:fl_news/src/services/news_services.dart';
import 'package:fl_news/src/theme/themeDark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsService())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
        theme: myTema,
      ),
    );
  }
}
