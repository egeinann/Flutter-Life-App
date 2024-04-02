import 'package:flutter/material.dart';
import 'package:yasam_uyg/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug yazısını kaldırır
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 121, 98, 146)),
      home: InputPage(),
    );
  }
}
