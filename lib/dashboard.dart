import 'package:flutter/material.dart';
import 'package:student_info/addinfo.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),

      ),

      body: Column(
        children: [

        ],

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>AddData())
          );
        },
        child: Icon(Icons.add),
      ),

      drawer: Drawer(

      ),
    );
  }
}
