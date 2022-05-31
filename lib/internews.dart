import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internews/page/home_page.dart';

class InterNews extends StatefulWidget {
  const InterNews({Key? key}) : super(key: key);

  @override
  State<InterNews> createState() => _InterNewsState();
}

class _InterNewsState extends State<InterNews> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.capriolaTextTheme(Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.black, displayColor: Colors.black)),
          primaryColor: Colors.black,
          backgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
