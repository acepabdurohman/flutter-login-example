import 'package:flutter/material.dart';
import 'package:login_example/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Login Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyLoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}