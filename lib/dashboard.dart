import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:student_info/Mithun/Arrows.dart';
import 'package:student_info/Mithun/List.dart';
import 'package:student_info/Mithun/Studentinfo.dart';
import 'package:student_info/addinfo.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  FirebaseAuth auth = FirebaseAuth.instance;

  late DatabaseReference _databaseReference;


  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),

      ),

      body: Column(
        children: [
            Text(auth.currentUser!.uid.toString()),
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
          InkWell(
            child: Icon(Icons.add,color: Colors.white,
            ),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                  builder: (context)=>add(),),);
            },
          ),

          InkWell(child: Icon(Icons.list, color: Colors.white),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                  builder: (context)=>list(),));
            },
          ),

          InkWell(child: Icon(Icons.compare_arrows, color: Colors.white),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(
                builder: (context)=>arrows(),));
          },
          ),
        ],
      ),

      drawer: Drawer(

      ),
    );
  }
}
