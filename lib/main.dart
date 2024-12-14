import 'package:flutter/material.dart';
import 'package:t3_shopping_list/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const _title = 'Shopping List';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: const LoginScreen(),
      ),
    );
  }
}