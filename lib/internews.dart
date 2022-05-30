import 'package:flutter/material.dart';
import 'package:internews/page/home_page.dart';

class InterNews extends StatefulWidget {
  const InterNews({Key? key}) : super(key: key);

  @override
  State<InterNews> createState() => _InterNewsState();
}

class _InterNewsState extends State<InterNews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}
