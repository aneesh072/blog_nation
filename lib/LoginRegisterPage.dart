import 'package:blog_nation/Authentication.dart';
import 'package:blog_nation/DialogBox.dart';
import 'package:flutter/material.dart';

//changes state within its lifetime
class LoginRegisterPage extends StatefulWidget {

LoginRegisterPage({
  this.auth,
  this.onSignedIn, onSignedOut,
});
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  State<StatefulWidget> createState() {
    return _LoginRegisterState();
  }

}
//form type to distinguish between login and register page
enum FormType
{
  login,
  register
}


class _LoginRegisterState extends State<LoginRegisterPage> {

  DialogBox dialogBox = new DialogBox();

    //THIS IS OUR DESIGN
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Blog Nation"),
      ),

      // Container for login and register text fields
      body: new SingleChildScrollView(
        
        
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }

  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  //creating variable to save strings for email and password
  String _email = "";
  String _password = "";
//METHODS
  bool validateAndSave() {
    final form = formKey.currentState;

    if(form.validate())
    {
      form.save();
      return true;
    }
    else{
      return false;
    }

  }



//if we have registered user then when pressed login, go to home page
void validateAndSubmit() async
{
  if(validateAndSave())
  {
    try
    {
      if(_formType == FormType.login)
      {
        String userId = await widget.auth.SignIn(_email, _password);
       // dialogBox.information(context, "Congratulations", "your are logged in successfully.");
        print("login userId = " + userId);
      }
      else{
        String userId = await widget.auth.SignUp(_email, _password);
       // dialogBox.information(context, "Congratulations", "your account has been created successfully.");
        print("Regisger userId = " + userId);
      }
      widget.onSignedIn();

    }
    catch(e){
      dialogBox.information(context, "Error", e.toString());
      print("Error = " + e.toString());

    }
  }

}

//this goes to the register to make a new user
  void moveToRegister() {
    //reset value from text fields
    formKey.currentState.reset(); 

    setState(() {
      _formType = FormType.register;
    });
  }

    void moveToLogin() {
      //reset value from text fields
    formKey.currentState.reset(); 

    setState(() {
      _formType = FormType.login;
    });
  }

  //this is our text field where we put our email and password
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
        //to message the user if the field is emply
        validator: (value)
        {
          return value.isEmpty ? 'Email is required.' : null;
        },
        //if saved , assign the value to the variable we created , 'email'
        onSaved: (value)
        {
          return _email = value;
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true ,

         validator: (value)
        {
          //to message the user if the field is emply
          return value.isEmpty ? 'Password is required.' : null;
        },
        onSaved: (value)
        {
           //if saved , assign the value to the variable we created , 'password'
          return _password = value;
        },
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
if(_formType == FormType.login){
      return [
      new RaisedButton(
        child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.orange,
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text("Not have an account? Create account",
            style: new TextStyle(fontSize: 14.0)),
        textColor: Colors.orange,
        onPressed: moveToRegister,
      ),
    ];
}
else{
      return [
      new RaisedButton(
        child: new Text("Create Account", style: new TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.orange,
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text("Already have an account? Login",
            style: new TextStyle(fontSize: 14.0)),
        textColor: Colors.orange,
        onPressed: moveToLogin,
      ),
    ];
}
  }
}
