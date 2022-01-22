import 'package:flutter/material.dart';
import 'package:student_info/password%20resert/check_email/check_email_view.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

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
    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckEmailView()));},
    ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Create\nNew password',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Your new password must at least Six characters and cannot spaces or match your email adddres.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Choose a Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  helperText: 'Must be at least 6 characters.',

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),

                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {
                      //change icon
                    },

                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Repeat Your Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  helperText: 'Both passwords must match.',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {
                      //change icon
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Set Password',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
