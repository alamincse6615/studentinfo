import 'package:flutter/material.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  _studentinfoState createState() => _studentinfoState();
}

class _studentinfoState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Info"),
      ),
      backgroundColor: Color(0xff0de8c8),
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("WELLCOME ADD PAGE"),
          )),
        ],
      ),
    );
  }
}
