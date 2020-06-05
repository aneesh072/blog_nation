import 'package:blog_nation/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:blog_nation/Mapping.dart';
import 'package:blog_nation/Authentication.dart';

void main() {
  runApp(new BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Blog App",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(auth: Auth(),),
    );
  }
} 
