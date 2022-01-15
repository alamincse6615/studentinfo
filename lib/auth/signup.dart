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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your phn"
                ),
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
                    border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
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
                    _signupinfo("","");
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

                      },
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
  _signupinfo(String email, String password){
    var isValid = _key.currentState!.validate();
    if(isValid){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Dashboard())
      );
      print("data is correct");
    }else{
      return;
    }
  }
}
