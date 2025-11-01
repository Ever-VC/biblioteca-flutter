import 'package:flutter/material.dart';
import 'package:myapp/presentation/widgets/main_navigator.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: NavigationMain(),
    );
  }
}