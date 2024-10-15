import 'package:api_bloc/presentation/pages/home/home_import.dart';
import 'package:api_bloc/presentation/pages/login/login_import.dart';
import 'package:api_bloc/presentation/pages/repositry/authrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthChecker extends StatelessWidget {
   AuthChecker({super.key});
final AuthRepositry repo = AuthRepositry();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: repo.user,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data;
            if(user == null){
              return LoginPage();
            }
            else{
              return HomePage();
            }
          }
          return const Scaffold(
            body: Center(
              child: SpinKitSquareCircle(
                color: Colors.white,
                size: 30,
              ),
            )
          );
        }
    );
  }
}
