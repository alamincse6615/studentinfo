import 'package:flutter/material.dart';

class lists extends StatefulWidget {
  const lists({Key? key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

class _listState extends State<lists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9cd009),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text("WELCOME LISTS PAGE",
              style: TextStyle(fontSize: 32 ), ),
          )
        ],
      ),
    );
  }
}
