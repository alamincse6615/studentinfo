import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/auth/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your Email"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: passCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your password"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){

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
                  Text("Create an Account ? "),
                  InkWell(child: Text("Registration",style: TextStyle(color: Color(
                      0xffe70c0c)),),onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>SignUp())
                    );
                  },),
                ],
              ),
            )
          ),

        ],
      ),
    );
  }
}
