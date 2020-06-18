import 'package:flutter/material.dart';
import 'package:blog_nation/Mapping.dart';
import 'package:blog_nation/Authentication.dart';

void main() {
  runApp(new BlogApp());
}
//give title and theme for our app
class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Blog App",
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      //starting page of the app
      home: MappingPage(auth: Auth(),),
    );
  }
} 
