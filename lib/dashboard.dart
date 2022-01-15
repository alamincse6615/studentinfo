import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(Icons.add,color: Colors.white,),
          Icon(Icons.list, color: Colors.white),
          Icon(Icons.compare_arrows, color: Colors.white),
        ],
        onTap: (index) {

        },
      ),

      drawer: Drawer(

      ),
    );
  }
}
