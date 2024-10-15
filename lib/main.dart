import 'package:api_bloc/data/remote/api/bloc/api_bloc.dart';
import 'package:api_bloc/data/remote/api/repositry/repos.dart';
import 'package:api_bloc/presentation/authchecker.dart';
import 'package:api_bloc/presentation/pages/bloc/auth_bloc.dart';
import 'package:api_bloc/presentation/pages/home/home_import.dart';
import 'package:api_bloc/presentation/pages/login/login_import.dart';
import 'package:api_bloc/presentation/pages/register/register_import.dart';
import 'package:api_bloc/presentation/pages/repositry/authrepo.dart';
import 'package:api_bloc/utility/utild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  //runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyALEZU-C9iyK2AhiqmO8e-p6WptwGEJV90",
    appId: "1:669616595280:android:16a025b7c3012868decc55",
    messagingSenderId: "669616595280",
    projectId: "apibloc-bfd18",
  ));
  final authRepo = AuthRepositry();
  final photo = PhotosRepository();

  try{
    runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AuthBloc(authRepositry: authRepo),),
        BlocProvider(create: (context) => PhotosBloc(photo),)
      ],
          child: const MyApp())
    );
  }catch(e){
    Utils().toastMessage("AuthBloc Initilization : $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
        designSize: const Size(360, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            "/": (context) =>  AuthChecker(),
            "registerPage": (context) => const RegisterPage(),
            "homepage":(context) => const HomePage()
          },
        ),
      );


  }
}
