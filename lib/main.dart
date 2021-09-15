import 'package:flutter/material.dart';
import 'package:news_app/api_Service/api_service.dart';
import 'package:news_app/screens/home.dart';

import 'models/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServiceApi client = ServiceApi();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureBuilder(
            future: client.getArticle(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                // ignore: unused_local_variable
                List<Article>? articles = snapshot.data;
                return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) =>
                      home(articles[index], context),
                  // ListTile(title: Text(articles[index].title.toString()),),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
