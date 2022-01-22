import 'package:flutter/material.dart';
import 'package:student_info/auth/signin.dart';
import 'package:student_info/password%20resert/check_email/check_email_view.dart';
import 'package:student_info/password_reset/util.dart';
import '../util.dart';

class SendInstructionsView extends StatelessWidget {
  const SendInstructionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            leadingWidth: 30,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));},
            ),
            actions: const [

            ],
          ),
          body: Center(

            child: Padding(
              padding: const EdgeInsets.all(20.0),

              child: ListView(

                children: [
                  Text(
                    'Recover\nyour account',
                    style: (TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 60)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'We can help you reset your password and security\'info. First, enter your Google account and follow\'the instructions below.',
                    style: TextStyle(color: Colors.black, fontSize: 20),),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Email, phone, or username ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      style:
                      TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          )),
                    ),
                    ),


                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          //navigate to check email view
                          Util.routeToWidget(context, const CheckEmailView());
                        },
                        child: const Text(
                          'Next Step',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.all( 26.10),
                        child: Icon(Icons.help_outline,
                          color: Colors.yellowAccent,
                        ),

                      )
                    ],
                  )

                ],
              ),
            ),

          ),
        ));
  }
}
