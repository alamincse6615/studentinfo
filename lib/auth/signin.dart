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

class _SignInState extends State<SignIn> {
  var _key = GlobalKey<FormState>();

  var passOff = true;
  Icon passIcon = Icon(Icons.visibility_off);
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //jisan
      appBar: AppBar(
        title: Text('Sign In'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              size: 28.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              tooltip: 'Menu',
              child: Icon(
                Icons.more_vert,
                size: 28.0,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.web,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Visit Us",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Add photos",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Love US",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Share",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app_rounded,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Exit",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: initialFirebase(),
          builder: (context, info) {
            return Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val == "") {
                          return "Email can't be empty";
                        }
                      },
                      controller: emailCtrl,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius
                              .circular(15),),
                          hintText: "Enter your Email"
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val == "") {
                          return "password can't be empty";
                        }
                        else if (val!.length < 6) {
                          return "password  must be 6 characters or above";
                        }
                      },
                      obscureText: passOff,
                      controller: passCtrl,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius
                              .circular(15),),
                          hintText: "Enter your password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (passOff) {
                                  passOff = false;
                                  passIcon = Icon(Icons.visibility);
                                }
                                else if (!passOff) {
                                  passOff = true;
                                  passIcon = Icon(Icons.visibility_off);
                                }
                              });
                            },
                            child: passIcon,
                          )

                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _signupinfo(emailCtrl.text, passCtrl.text);
                        },
                        child: Text("Sign In"),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Create An New Account ? "),
                            InkWell(child: Text(
                              "Sign Up", style: TextStyle(color: Color(
                                0xffe70c0c)),), onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp())
                              );
                            },
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }

  _signupinfo(String fdafdfojial, String dfjasl) async {
    var isValid = _key.currentState!.validate();
    if (isValid) {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: fdafdfojial, password: dfjasl);
      if (credential.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard())
        );
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
