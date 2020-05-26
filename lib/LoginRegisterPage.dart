import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LoginRegisterState();
  }
}

class _LoginRegisterState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Blog Nation"),
      ),

      // Container for login and register text fields
      body: new Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch ,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 20.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
      ),
      SizedBox(
        height: 20.0,
      ),
    ];
  }
//components for our logo in login page
  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 110.0,
        child: Image.asset('images/app_logo.png'),
      ),
    );
  }
//2 buttons that we have on login page
  List<Widget> createButtons() {
    return [
      new RaisedButton(
        child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.green,
      ),
      new FlatButton(
        child: new Text("Not have an account? Create account",
            style: new TextStyle(fontSize: 14.0)),
        textColor: Colors.white,
      ),
    ];
  }
}
