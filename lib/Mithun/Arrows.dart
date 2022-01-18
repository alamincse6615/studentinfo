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
      appBar: AppBar(
        title: Text("Arrows Page"),

      ),
      backgroundColor: Color(0xffe3b813),
          body:
          Column(
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("WELCOME ARROWS PAGE"),
              )),
            ],
          ),

    );
  }
}
