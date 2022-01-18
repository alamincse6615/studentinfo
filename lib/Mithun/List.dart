import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      backgroundColor: Color(0xff9cd009),
      body: Column(
        children:  [
          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("WELCOME LIST PAGE",),
          ))
        ],
      ),
    );
  }
}
