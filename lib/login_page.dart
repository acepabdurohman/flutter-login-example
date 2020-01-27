import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:login_example/main.dart';


class MyLoginPage extends StatefulWidget {

  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext buildContext) {

    final txtUsername = TextField(
      controller: usernameController,
      obscureText: false,
      style: textStyle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Masukan username',
        border: OutlineInputBorder(),
        labelText: 'Username'
      ),
    );

    final txtPassword = TextField(
      controller: passwordController,
      obscureText: true,
      style: textStyle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Masukan password',
        border: OutlineInputBorder(),
        labelText: 'Password'
      ),
    );

    final btnLogin = Material(
      elevation: 5.0,
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(buildContext).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            
          });
          logIn(usernameController.text, passwordController.text);
        },
        child: Text(
          'LOGIN',
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('MY APP'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset("images/logo.png", fit: BoxFit.contain,),
                ),
                SizedBox(height: 45.0,),
                txtUsername,
                SizedBox(height: 25.0,),
                txtPassword,
                SizedBox(height: 35.0,),
                btnLogin,
                SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logIn(String username, password) async {
    print(username);
    print(password);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final _baseUrl = 'https://leumart-api.herokuapp.com';

    Map<String, String> data = {
      "username": username,
      "password": password
    };

    Map<String, String> inputHeader = {
      'Content-Type': 'application/json'
    };

    var url = _baseUrl + '/api/users/login';

    http.post(url, body: json.encode(data), headers: inputHeader).then((http.Response response){
      if (response.statusCode == 200) {
        print(response.body);
        var loginResponse = json.decode(response.body);
        Map<String, dynamic> token = loginResponse['token'];
        print('Token : ' + token['access_token']);
        sharedPreferences.setString('accessToken', token['access_token']);
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => DashboardPage()), (Route<dynamic> route) => false);
        Navigator.pushNamed(context, '/');
      } 
    });
  }
}