import 'package:blog_nation/Authentication.dart';
import 'package:flutter/material.dart';
import 'PhotoUpload.dart';

class HomePage extends StatefulWidget
{

  HomePage({
    this.auth,
    this.onSignedOut,
  });

final AuthImplementation auth;
final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
{

   void _logoutUser() async
   {
     try{
        await widget.auth.signOut();
        widget.onSignedOut();
     }
     catch(e)
     {
        print(e.toString());
     }
   }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Container(

      ),

      bottomNavigationBar: new BottomAppBar(
        color: Colors.red,

        child: new Container(
          margin: const EdgeInsets.only(left: 50.0 , right: 50.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
               new IconButton(
                 icon: new Icon(Icons.local_car_wash),
                 iconSize: 50,
                 color: Colors.white,

                 onPressed:  _logoutUser,
               ),

                          new IconButton(
                 icon: new Icon(Icons.add_a_photo),
                 iconSize: 40,
                 color: Colors.white,
                 onPressed:  ()
                 {
                   Navigator.push
                   (
                     context,
                      MaterialPageRoute(builder: (context){
                        return new UploadPhotoPage();
                      })
                      );
                 },
               ),
            ],
          ),
        ),
      ),
    );
  }
}