import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/members.dart';
import 'package:message_app/main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        // TextButton(
                        //     onPressed: () {},
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         Icon(Icons.add),
                        //         SizedBox(
                        //           width: 2,
                        //         ),
                        //         Text(
                        //           "Create new account",
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //           textAlign: TextAlign.end,
                        //         ),
                        //       ],
                        //     )),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'Images/logo.png',
                              height: 250,
                              width: 200,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Login",
                          style: GoogleFonts.arimo(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 28.0,
                        //     fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.center,

                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                            validator: (value) {
                              bool emailVaild = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return "Please enter a email!";
                              } else if (!emailVaild) {
                                return "Enter a Valid email";
                              }
                            },
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.black,
                                ),
                                hintText: "E-mail",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onSaved: (value) => _emailController =
                                value! as TextEditingController),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a email!";
                            } else if (_passwordController.text.length <= 8) {
                              print(
                                  "Password and length ${_passwordController.text} & ${_passwordController.text.length}");
                              return "Must be 8 characters!";
                            }
                          },
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  _togglevisibility();
                                },
                                child: Icon(
                                  Icons.key,
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onSaved: (value) => _passwordController =
                              value! as TextEditingController,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: double.infinity,
                          child: RawMaterialButton(
                            fillColor: Color.fromARGB(255, 184, 12, 0),
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signIn();
                              }
                            },
                            // onPressed: signIn,
                            // async {
                            //   Navigator.of(context).pushReplacement(
                            //       MaterialPageRoute(
                            //           builder: (context) => HomePage()));
                            //   print("Validated");
                            // },
                            // else {
                            // AwesomeDialog(
                            //   context: context,
                            //   dialogType: DialogType.ERROR,
                            //   animType: AnimType.RIGHSLIDE,
                            //   headerAnimationLoop: true,
                            //   title: 'Error',
                            //   desc:
                            //       'Dialog description here..................................................',
                            //   btnOkOnPress: () {},
                            //   btnOkIcon: Icons.cancel,
                            //   btnOkColor: Colors.red,
                            // ).show();
                            // }
                            //     async {
                            //   User? user = await loginUsingEmailPassword(
                            //       email: _emailController.text,
                            //       password: _passwordController.text,
                            //       context: context);
                            //   print("---------------> $user");
                            //   if (user != null) {
                            //     Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (context) => HomePage()));
                            //   }
                            // },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ));
    try {
      print("------------------->");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      if (_emailController.text.isEmpty) {}
    } on FirebaseAuthException catch (e) {
      print("----------------->$e");
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
