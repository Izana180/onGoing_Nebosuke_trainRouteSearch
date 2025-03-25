import 'package:flutter/material.dart';
import 'package:nebosuke_trainroutesearch/presentation/style/custom_colors.dart';
import 'presentation/pages/top_page.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/input/custom_basic_input.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ねぼすけあんない',
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.blackBackground,
        primarySwatch: Colors.green,
      ),
      home: TopPage(),
    );
  }
}