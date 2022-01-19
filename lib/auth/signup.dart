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
    return Scaffold(

      // appBar: AppBar(
      //   title: Text('Sign Up Page'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/login.png"
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
            future: initialFirebase(),
            builder: (context,info){
              return Form(
                key: _key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150, right: 100),
                      child: Text("Registation\nNow",
                        style:TextStyle(fontSize: 35, color: Colors.white) ,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: nameCtrl,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Enter your Name"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phnCtrl,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                            hintText: "Enter your phn"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (val){
                          if(val==""){
                            return "Email can't be empty";
                          }

                        },
                        controller: emailCtrl,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                            hintText: "Enter your Email"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (val){
                          if(val==""){
                            return "password can't be empty";
                          }
                          else if (val!.length<6){
                            return "password  must be 6 characters or above";
                          }
                        },
                        obscureText: passOff,
                        controller: passCtrl,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                            hintText: "Enter your password",
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(passOff){
                                    passOff = false;
                                    passIcon = Icon(Icons.visibility);
                                  }
                                  else if (!passOff){
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
                          onPressed: (){
                            _signupinfo(nameCtrl.text,phnCtrl.text,emailCtrl.text,passCtrl.text);
                          },
                          child: Text("Sign Up"),
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an Account ? "),
                              InkWell(child: Text("Sign In",style: TextStyle(color: Color(
                                  0xffe70c0c)),),onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignIn())
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
      )
    );
  }
  _signupinfo(String name, String phn, String fdafdfojial, String dfjasl)async{
    var isValid = _key.currentState!.validate();
    if(isValid){
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential credential =  await auth.createUserWithEmailAndPassword(email: fdafdfojial, password: dfjasl);
      if(credential.user != null){
        saveinof(name,phn,fdafdfojial,dfjasl,auth.currentUser!.uid);

      }else{


      }

    }else{
      return;
    }
  }

  Future<FirebaseApp> initialFirebase()async{
    FirebaseApp fbapp = await Firebase.initializeApp();
    return fbapp;
  }

  saveinof(String name, String phn, String email, String pass, String uid){
    Map<dynamic,dynamic> info = {
      "name":name,
      "phn":phn,
      "email":email,
      "password":pass,
      "uid":uid,
    };
    _databaseReference.child("UserInfo").child(uid).set(info);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>Dashboard())
    );
  }
}
