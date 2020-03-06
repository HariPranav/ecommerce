import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
// here the AuthService is available via the _auth variable for the SignInState Widget
// store the email id and pass in a local text variable
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign In"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey, 
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            TextFormField(
              decoration: TextInputDecoration.copyWith(hintText : 'Email'),
              validator: (val) => val.isEmpty ? 'Enter an Email' : null,
              onChanged: (val) {
              setState(() => email = val);
            }),
            SizedBox(height: 20),
            TextFormField(
              decoration: TextInputDecoration.copyWith(hintText : 'Password'),
              validator: (val) => val.length < 6
                  ? 'Enter Password having Characters > 6'
                  : null,
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                  print('valid');
                  if (result == null) {
                    setState(() => error = 'Could Not Sign In With the Creadentials');
                  }
                }
              },
              color: Colors.pink[400],
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),
             SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),  
          ]),
        ),
      ),
    );
  }
}
