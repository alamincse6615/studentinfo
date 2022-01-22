import 'package:flutter/material.dart';

class arrows extends StatefulWidget {
  const arrows({Key? key}) : super(key: key);

  @override
  _arrowsState createState() => _arrowsState();
}

class _arrowsState extends State<arrows> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),

            child: Text("WELCOME ARROWS PAGE",
              style: TextStyle(fontSize: 30 ),),
          ),
        ],
      ),

    );
  }
}