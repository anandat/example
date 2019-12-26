import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/signUp.dart';
import 'forgotPass.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userId = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  var _textStyleBlack = new TextStyle(fontSize: 12.0, color: Colors.black);
  var _textStyleGrey = new TextStyle(fontSize: 12.0, color: Colors.grey);
  var _textStyleBlueGrey =
      new TextStyle(fontSize: 12.0, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    //  bottomNavigationBar: _bottomBar(),
      body: _body(),
    );
  }

  Widget _userIDEditContainer() {
    return new Container(
      child: new TextField(
        controller: _userId,
        decoration: new InputDecoration(
            hintText: 'Phone number,email or username',
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black),
            ),
            isDense: true),
        style: _textStyleBlack,
      ),
    );
  }

  Widget _passwordEditContainer() {
    return new Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: new TextField(
        controller: _password,
        obscureText: true,
        decoration: new InputDecoration(
            hintText: 'Password',
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black),
            ),
            isDense: true),
        style: _textStyleBlack,
      ),
    );
  }

  Widget _loginContainer() {
    return new GestureDetector(
      onTap: _login,
      child: new Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10.0),
        width: 500.0,
        height: 40.0,
        child: new Text(
          "Log In",
          style: new TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      ),
    );
  }

  Widget _facebookContainer() {
    return new Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10.0),
      width: 500.0,
      height: 40.0,
      color: Colors.blue,
      child: new GestureDetector(
        onTap: null,
        child: new Text(
          "Log in with facebook",
          style:
              new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return new Container(
        alignment: Alignment.center,
        height: 50.0,
        child: new Column(
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: 1.0,
                  color: Colors.grey.withOpacity(0.7),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 17.5),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Dont have an account?', style: _textStyleGrey),
                      new Text('Sign up.', style: _textStyleBlueGrey),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _body() {
    return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
              child: new Text(
                'Instagram',
                style: new TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
              ),
            ),
            _userIDEditContainer(),
            SizedBox(
              height: 10,
            ),
            _passwordEditContainer(),
            SizedBox(
              height: 10,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Text(
                    'Forgot your login details?',
                    style: _textStyleGrey,
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPass()));
                  } ,
                )
                ,
              ],
            ),
            _loginContainer(),

            SizedBox(
              height: 10,
            ),
            _facebookContainer(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2.7,
                  color: Colors.grey,
                  child:  ListTile(),
                ),
                 Text(
                  ' OR ',
                  style:  TextStyle(color: Colors.blueGrey),
                ),
                 Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2.7,
                  color: Colors.grey,
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              child: InkWell(
                child: Text("SignUp"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    if (_userId.text.isEmpty) {
      _showEmptyDialog("Type something");
    } else if (_password.text.isEmpty) {
      _showEmptyDialog("Type something");
    } else {
      Navigator.of(context).pushReplacementNamed('/HomeScreen');
    }
  }

  _showEmptyDialog(String title) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => new CupertinoAlertDialog(
              content: new Text("$title can't be empty"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"))
              ],
            ));
  }
}
