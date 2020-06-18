import 'package:flutter/material.dart';
import 'LoginRegisterPage.dart';
import 'HomePage.dart';
import 'Authentication.dart';

class MappingPage extends StatefulWidget
{
  final AuthImplementation auth;

  MappingPage({
    this.auth,
  });
  State<StatefulWidget> createState()
  {
    return _MappingPageState();
  }
}

//two states one when signed in and one when not
enum AuthStatus
{
  notSignedIn,
  signedIn,
}


class _MappingPageState extends State<MappingPage>
{
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserId)
    {
      setState(() {
        authStatus = firebaseUserId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    }); 
  }

  void _signedIn()
  {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

    void _signOut()
  {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus)
    {
      //when not signed in, set state to LoginPage
      case AuthStatus.notSignedIn:
      return new LoginRegisterPage(
        auth: widget.auth,
        onSignedIn: _signedIn, 
      );
    //when signed in, set state to homepage
       case AuthStatus.signedIn:
      return new HomePage(
        auth: widget.auth,
        onSignedOut: _signOut, 
      );
    }

    
    return null;
  }


}