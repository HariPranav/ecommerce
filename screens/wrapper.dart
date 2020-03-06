import 'package:ecommerce/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/user.dart';

import 'home/home.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    if(user==null)
    {
      return Authenticate();

    }
    else
    {
      return Home();
    }
      //return home or authenticate
      // we need to dynamically hcange the state hence we use a stream
      
      // we use streams to determine the changes to automatically change in firebase
    
  }
}