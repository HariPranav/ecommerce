import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("THis is America"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async{
              await _auth.SignOut();
            },
            icon: Icon(Icons.person),
            label: Text("logout"),
          )
        ],
      ),
    );
  }
}
