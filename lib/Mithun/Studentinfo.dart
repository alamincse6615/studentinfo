import 'package:flutter/material.dart';

class adds extends StatefulWidget {
  const adds({Key? key}) : super(key: key);

  @override
  _studentinfoState createState() => _studentinfoState();
}

class _studentinfoState extends State<adds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text("WELLCOME ADD PAGE",
            style: TextStyle(fontSize: 32 ),),
          ),
        ],
      ),
    );
  }
}
