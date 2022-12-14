import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/sign_in.dart';
import 'package:finance_app/screens/sign_up.dart';
import 'package:flutter/material.dart';



class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {


  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }


  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      if(optionSignIn){
        return SignIn(toggleView:  toggleView);
      }

      return MyHomePage();
    }

    else {
      if(!optionSignIn){
        return SignUp(toggleView:  toggleView);
      }
      return MyHomePage();
    }
  }
}