import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {

  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext buildContext) {

    final txtUsername = TextField(
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
        onPressed: () {},
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
}