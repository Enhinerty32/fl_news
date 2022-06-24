import 'package:fl_news/src/models/news_models.dart';
import 'package:fl_news/src/theme/themeDark_theme.dart';
import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  ListNews({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: ((context, index) {
          return _NewItem(index: index, article: news[index]);
        }));
  }
}

class _NewItem extends StatelessWidget {
  final Article article;
  final int index;

  const _NewItem({required this.index, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _CardTopBar(
          index: index,
          news: article,
        ),
        _CardTittle(news: article),
        _CardItemImage(news: article),
        _CardBody(news: article),
        _CardButtons(),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _CardButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            child: Icon(Icons.star_border),
            onPressed: (() {}),
            fillColor: accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            child: Icon(Icons.more),
            onPressed: (() {}),
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article news;

  const _CardBody({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(news.description ?? ''),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _CardTopBar({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text(
          '${index + 1}. ',
          style: TextStyle(color: accentColor),
        ),
        Text(
          '${news.source.name}',
        ),
      ]),
    );
  }
}

class _CardTittle extends StatelessWidget {
  final Article news;

  const _CardTittle({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '${news.title}',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardItemImage extends StatelessWidget {
  final Article news;

  const _CardItemImage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (news.urlToImage == null ||
                    !news.urlToImage!.contains('http') ||
                    news.urlToImage!.isEmpty)
                ? const FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: AssetImage('assets/img/no-image.png'))
                : FadeInImage(
                    placeholder: const AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage('${news.urlToImage}'))),
      ),
    );
  }
}
