import 'package:flutter/material.dart';
import 'package:student_info/password%20resert/create_new_password/create_new_password_view.dart';
import 'package:student_info/password_reset/util.dart';

import '../util.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({Key? key}) : super(key: key);

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
    onPressed: () {},
    ),

    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.greenAccent,
                      size: 100,
                    ),

                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Check your Gmail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'We have sent password recovery instructions to your email.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                        ),
                      ),
                    )
    ),
      ]
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      //navigate to create new password view
                      Util.routeToWidget(context, const CreateNewPasswordView());
                    },
                    child: const Text(
                      'Open Gmail',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip, I\'ll confirm later',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Did not receive the email? Check your spam filter', style: TextStyle(fontSize: 13, color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Or'),
                    TextButton(
                      onPressed: () {},
                      child: Text('Try another email address', style: TextStyle(fontSize: 20, color: Colors.greenAccent),),
                    ),
                  ],
                )
              ],
            )
          ],
        ),

      ),

    ));

  }

}
