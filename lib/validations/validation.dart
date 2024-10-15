import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/utild.dart';

class Validation{
  final _fromKey = GlobalKey<FormState>();
  String? _validateEmail(String? value){
    if(value == null || value.isEmpty){
      return "Enter your email";
    }
    final emailRegExp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if(!emailRegExp.hasMatch(value)){
      Utils().toastMessage("Enter valid mail");
    }
    return null;
  }
  String? _validatePassword(String? value){
    if(value == null||value.isEmpty){
      Utils().toastMessage("Password is required");
    }
    else if(value.length < 6){
      Utils().toastMessage("password must be 6 digit");
    }
    return null;
  }
  String? _valideteName(String? value){
    if(value == null||value.isEmpty){
      Utils().toastMessage("Name is required");
    }
    return null;
  }
  String? _validateConfirmPassword(String? value ,TextEditingController con){
    if(value==null||value.isEmpty){
      Utils().toastMessage("Confirm password required");
    }
    else if(value != con.text){
      Utils().toastMessage("Password don't match");
    }
    return null;
  }
  void _onRegisteredPressed(BuildContext context){
    if(_fromKey.currentState?.validate()??false){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration Successfull")));
    }
  }
}