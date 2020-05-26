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
    );
  }
}
