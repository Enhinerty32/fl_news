import 'package:fl_news/src/pages/tab1_page.dart';
import 'package:fl_news/src/pages/tab2_page.dart';
import 'package:fl_news/src/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegationModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);
    return BottomNavigationBar(
        onTap: (i) => navegationModel.paginaActual = i,
        currentIndex: navegationModel.paginaActual,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore_outlined), label: 'Encabezados'),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);

    return PageView(
        controller: navegationModel.pageController,
        physics: NeverScrollableScrollPhysics()
        // BouncingScrollPhysics()
        ,
        children: <Widget>[
          Tap1Page(),
          Tab2Page(),
        ]);
  }
}

class _NavegationModel extends ChangeNotifier {
//es un provider centralizado en escuchar cambios de de valor de _Navegation y transicion de _Paginas

  PageController _pageController = new PageController();

  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
