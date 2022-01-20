import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/auth/signup.dart';
import 'package:student_info/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

//jisan
class _SignInState extends State<SignIn> {
  var _key = GlobalKey<FormState>();

  var passOff = true;
  Icon passIcon = Icon(Icons.visibility_off);
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/register.png'), fit: BoxFit.cover),
        ),
        //jisan

        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'Welcome\nStudent',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              SingleChildScrollView(
                child: FutureBuilder(
                  future: initialFirebase(),
                  builder: (context, info) {
                    return Form(
                        key: _key,
                        child: Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 35, right: 35),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          validator: (val) {
                                            if (val == "") {
                                              return "Email can't be empty";
                                            }
                                          },
                                          controller: emailCtrl,
                                          decoration: InputDecoration(
                                              fillColor: Colors.grey.shade100,
                                              filled: true,
                                              hintText: "Enter your Email",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(),
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            validator: (val) {
                                              if (val == "") {
                                                return "password can't be empty";
                                              } else if (val!.length < 6) {
                                                return "password  must be 6 characters or above";
                                              }
                                            },
                                            obscureText: passOff,
                                            controller: passCtrl,
                                            decoration: InputDecoration(
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                hintText: "Enter your password",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (passOff) {
                                                        passOff = false;
                                                        passIcon = Icon(
                                                            Icons.visibility);
                                                      } else if (!passOff) {
                                                        passOff = true;
                                                        passIcon = Icon(Icons
                                                            .visibility_off);
                                                      }
                                                    });
                                                  },
                                                  child: passIcon,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _signupinfo(emailCtrl.text,
                                                    passCtrl.text);
                                              },
                                              child: Text("Sign In",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  )),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Create An New Account ? ",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      )),
                                                  InkWell(
                                                    child: Text(
                                                      "Sign Up",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xffe70c0c)),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      SignUp()));
                                                    },
                                                  ),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Forgot Password',
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color:
                                                              Color(0xfff9fafc),
                                                          fontSize: 18,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ])));
                  },
                ),
              ),
            ])));
  }

  _signupinfo(String fdafdfojial, String dfjasl) async {
    var isValid = _key.currentState!.validate();
    if (isValid) {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: fdafdfojial, password: dfjasl);
      if (credential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        print("data is correct");
      }
    } else {
      return;
    }
  }

  Future<FirebaseApp> initialFirebase() async {
    FirebaseApp fbapp = await Firebase.initializeApp();
    return fbapp;
  }
}
//created by Hm Imam Hossen
