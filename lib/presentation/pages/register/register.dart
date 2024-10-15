part of 'register_import.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCon1 = TextEditingController();
  TextEditingController nameCon1 = TextEditingController();
  TextEditingController passCon1 = TextEditingController();
  TextEditingController cPassCon1 = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Utils().toastMessage('Authenticated as ${state.email}');
            } else if (state is AuthFailure) {
              Utils().toastMessage('Auth Failed: ${state.error}');
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const SpinKitSquareCircle(
                  size: 40,
                  color: Colors.white,
                );
              }
              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 35.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0.r),
                              border:
                                  Border.all(color: Colors.white, width: 1.2.w),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.arrow_left,
                                size: 25,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        loginText(
                            "Register", FontWeight.bold, 25, Colors.white, 2.0),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        loginText("Let's continue to create an account",
                            FontWeight.bold, 16, Colors.grey, 1),
                        SizedBox(
                          height: 50.h,
                        ),
                        loginText(
                            "Name :", FontWeight.bold, 18, Colors.white, 2),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextField(
                            nameCon1,
                            TextInputType.name,
                            false,
                            "Enter your name",
                            CupertinoIcons.person,
                            "email",
                            () {}),
                        SizedBox(
                          height: 20.h,
                        ),
                        loginText(
                            "Email :", FontWeight.bold, 18, Colors.white, 2),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextField(
                            emailCon1,
                            TextInputType.name,
                            false,
                            "Enter your email",
                            CupertinoIcons.mail,
                            "email",
                            () {}),
                        SizedBox(
                          height: 20.h,
                        ),
                        loginText(
                            "Password :", FontWeight.bold, 18, Colors.white, 1),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextField(
                            passCon1,
                            TextInputType.number,
                            isObscure,
                            "Enter your Password",
                            CupertinoIcons.eye_fill,
                            "register", () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        }),
                        SizedBox(
                          height: 20.h,
                        ),
                        loginText("Confirm Password :", FontWeight.bold, 18,
                            Colors.white, 1),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextField(
                            cPassCon1,
                            TextInputType.number,
                            isObscure,
                            "Enter your confirm Password",
                            CupertinoIcons.eye_fill,
                            "register", () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        }),
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: customButton(
                            "Register",
                            () {
                              if (emailCon1.text.isEmpty &&
                                  nameCon1.text.isEmpty &&
                                  passCon1.text.isEmpty &&
                                  cPassCon1.text.isEmpty) {
                                Utils().toastMessage("Fill all the fields");
                              } else {
                                final email = emailCon1.text;
                                final passwords = passCon1.text;
                                BlocProvider.of<AuthBloc>(context)
                                    .add(AuthSignUpRequested(email, passwords));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loginText("Already have an account ? ",
                                FontWeight.bold, 13, Colors.white, 2),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: loginText("Login", FontWeight.bold, 14,
                                    Colors.green, 2))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
