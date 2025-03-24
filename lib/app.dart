import 'package:flutter/material.dart';
import 'presentation/pages/top_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ねぼすけあんない',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TopPage(),
    );
  }
}