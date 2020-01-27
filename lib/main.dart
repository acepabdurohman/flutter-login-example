import 'package:flutter/material.dart';
import 'package:login_example/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Login Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // home: MyLoginPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (buildContext) => DashboardPage(),
        '/login': (buildContext) => MyLoginPage()
      },
    );
  }
}

class DashboardPage extends StatefulWidget {

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('accessToken') == null) {
      print('Access token not found');
      Navigator.pushNamed(context, '/login');
    } else {
      print('Access token found');
    }
  }

  @override
  Widget build(BuildContext buildContext) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('HOME'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.pushNamed(context, '/login');
            },
            child: Text('Log out', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Center(child: Text('Hello World')),
    );
  }
}