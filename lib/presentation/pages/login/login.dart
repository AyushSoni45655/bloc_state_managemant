part of'login_import.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<AuthBloc,AuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {

          if(state is AuthAuthenticated){
            Utils().toastMessage('Authenticated as ${state.email}');
          }
          else if(state is AuthFailure){
            Utils().toastMessage('Auth Failed: ${state.error}');
          }
        },
        child: BlocBuilder<AuthBloc,AuthState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if(state is AuthLoading){
              SpinKitSquareCircle(color: Colors.white,size: 40,);
            }
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w,right: 30.w),
                  child: Column(
                    children: [
                      SizedBox(height: 120.h,),
                      loginText("SignUp", FontWeight.bold,25, Colors.white, 2.0),
                      SizedBox(height: 10.0.h,),
                      loginText("Let's create an account !!!", FontWeight.bold, 16, Colors.grey, 1),
                      SizedBox(height: 50.h,),
                      loginText("Email :", FontWeight.bold, 18, Colors.white, 2),
                      SizedBox(height: 10.h,),
                      customTextField(emailCon, TextInputType.name, false, "Enter your email", CupertinoIcons.mail,"email",() {

                      }),
                      SizedBox(height: 20.h,),
                      loginText("Password :", FontWeight.bold, 18, Colors.white, 1),
                      SizedBox(height: 10.h,),
                      customTextField(passCon, TextInputType.number, isObscure, "Enter your Password", CupertinoIcons.eye_fill,"register",() {
                        setState(() {
                          isObscure = !isObscure;
                        },);
                      }),
                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Container(
                            height: 20.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0.r),
                                border: Border.all(color: Colors.white,width: 1.w)
                            ),
                            child:  Center(
                              child: Icon(CupertinoIcons.checkmark_alt,color: Colors.blue,size: 20.sp,),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          loginText("Remember me", FontWeight.bold, 12, Colors.white, 1.2),
                          SizedBox(width: 30.w,),
                          loginText("forgot Password ?", FontWeight.bold, 13, Colors.white, 1.2)
                        ],
                      ),
                      SizedBox(height: 40.h,),
                      customButton("Login",() {
                        final email = emailCon.text;
                        final passwords = passCon.text;
                        if(emailCon.text.isEmpty&&passCon.text.isEmpty){
                          Utils().toastMessage("Enter all the fields");
                        }
                        else{
                          BlocProvider.of<AuthBloc>(context).add(AuthLoginRequested(passwords, email));
                          Navigator.pushNamed(context, "homepage");
                        }
                      },),
                      SizedBox(height: 70.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loginText("Don't have an account ? ", FontWeight.bold,13,  Colors.white, 2),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "registerPage");
                              },
                              child: loginText("Register", FontWeight.bold, 14, Colors.green, 2))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
