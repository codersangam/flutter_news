import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class Post extends StatelessWidget {
  final Article? article;

  Post({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article!.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article!.urlToImage.toString()),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                article!.source!.name.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article!.description.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
