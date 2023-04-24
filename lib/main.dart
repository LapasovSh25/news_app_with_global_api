import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_with_global_api/view/home_page.dart';

void main(List<String> args) async{
   await dotenv.load(fileName: ".env");
  runApp(const NewsApp());
}


class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
