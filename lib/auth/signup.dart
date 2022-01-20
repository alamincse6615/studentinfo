import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/auth/signin.dart';
import 'package:student_info/dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  var _key = GlobalKey<FormState>();
  var passOff = true;
  Icon passIcon = Icon(Icons.visibility_off);
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final phnCtrl = TextEditingController();
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    //jisan
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 30),
                child: Text(
                  'Create\nStudent Account',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: FutureBuilder(
                    future: initialFirebase(),
                    builder: (context, info) {
                      return Form(
                        key: _key,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35, right: 35),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 35, right: 35),
                              child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  controller: nameCtrl,

                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Enter your Name",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(

                              padding: EdgeInsets.only(left: 35, right: 35),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: phnCtrl,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Enter your Number",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 35, right: 35),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),

                                validator: (val) {
                                  if (val == "") {
                                    return "Email can't be empty";
                                  }
                                },
                                controller: emailCtrl,

                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Enter your Email",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 35, right: 35),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
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
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Enter your password",
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (passOff) {
                                            passOff = false;
                                            passIcon = Icon(Icons.visibility);
                                          } else if (!passOff) {
                                            passOff = true;
                                            passIcon =
                                                Icon(Icons.visibility_off);
                                          }
                                        });
                                      },
                                      child: passIcon,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 35, right: 35),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        _signupinfo(nameCtrl.text,phnCtrl.text,emailCtrl.text,passCtrl.text);

                                      },
                                      child: Text("Sign Up",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700),),
                                    )
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Already have an Account ? "),
                                      InkWell(
                                        child: Text(
                                          "Sign In",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color(0xffffffff)),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignIn()));
                                        },
                                      ),

                                    ],
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ])));
  }

  _signupinfo(
      String name, String phn, String fdafdfojial, String dfjasl) async {
    var isValid = _key.currentState!.validate();
    if (isValid) {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: fdafdfojial, password: dfjasl);
      if (credential.user != null) {
        saveinof(name, phn, fdafdfojial, dfjasl, auth.currentUser!.uid);
      } else {}
    } else {
      return;
    }
  }

  Future<FirebaseApp> initialFirebase() async {
    FirebaseApp fbapp = await Firebase.initializeApp();
    return fbapp;
  }

  saveinof(String name, String phn, String email, String pass, String uid) {
    Map<dynamic, dynamic> info = {
      "name": name,
      "phn": phn,
      "email": email,
      "password": pass,
      "uid": uid,
    };
    _databaseReference.child("UserInfo").child(uid).set(info);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }
}
