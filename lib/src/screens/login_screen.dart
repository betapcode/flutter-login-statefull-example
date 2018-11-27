import 'package:flutter/material.dart';
import '../mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }

}


class LoginScreenState extends State<LoginScreen> with ValidationMixins{

  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  Widget build(context) {
    
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(padding: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email Address:',
          hintText: 'you@example.com'
        ),
        // validator: (String value) {
        //   if (!value.contains('@')) {
        //     return 'Please enter a  valid email';
        //   }
        // },
        validator: validateEmail,
        onSaved: (String value) {
          //print(value);
          email = value;
        },
      );
  }

  Widget passwordField() {

    return TextFormField(
      //obscureText: true,
      decoration: InputDecoration(
        labelText: 'Enter Password:',
        hintText: 'Password'
      ),
      // validator: (String value) {
      //   if (value.length < 4) {
      //     return 'Password must be at least 4 characters';
      //   }
      // },
      validator: validatePassword,
      onSaved: (String value) {
        //print(value);
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit !'),
      onPressed: (){
        print("you touch me !");
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("Time to post $email and $password to my API");
        }
      },
    );
  }


}