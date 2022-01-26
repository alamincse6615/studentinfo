import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/Mithun/Arrows.dart';
import 'package:student_info/Mithun/user_list.dart';
import 'package:student_info/Mithun/Studentinfo.dart';
import 'package:student_info/addinfo.dart';
import 'package:student_info/drawer/my_drawer_header.dart';
import 'package:student_info/drawer/grid_search.dart';
import 'package:student_info/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var page = [arrows(), UserList(), adds()];
  var index = 0;

  FirebaseAuth auth = FirebaseAuth.instance;

  late DatabaseReference _databaseReference;

  var currentPage;

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //jisan
      appBar: AppBar(
        title: Text('Dashdoard'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.search,
                size: 28.0,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GridSearchScreen(),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              tooltip: 'Menu',
              child: Icon(
                Icons.more_vert,
                size: 28.0,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.web,
                        color: Colors.indigoAccent,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Visit Us",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.indigoAccent,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Add photos",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.indigoAccent,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Love US",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.indigoAccent,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Share",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app_rounded,
                        color: Colors.indigoAccent,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          "Exit",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)),
          ),
          null,
          0,
        ),
      ),

      body:
          // Text(auth.currentUser!.uid.toString()),
          page[index],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddData()));
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(Icons.list, color: Colors.white),
          Icon(Icons.compare_arrows, color: Colors.white),
        ],
        backgroundColor: Colors.white,
        color: Colors.indigoAccent,
        buttonBackgroundColor: Colors.indigoAccent,
        animationCurve: Curves.easeInOut,
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [

          ListTile(
            leading: Icon(Icons.person,size: 20,
              color: Colors.indigoAccent,),
            title: Text('Profile'),
            onTap: () {Navigator.push(
                context, MaterialPageRoute(builder: (context)=>Profile()));},

          ),

          ListTile(
            leading: Icon(Icons.favorite,size: 20,
              color: Colors.indigoAccent,),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.message,size: 20,
              color: Colors.indigoAccent,),
            title: Text('message'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.event,size: 20,
              color: Colors.indigoAccent,),
            title: Text('Events'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.fiber_new_sharp,size: 20,
              color: Colors.indigoAccent,),
            title: Text('News Feed'),
            onTap: () => null,
            trailing: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipOval(
    child: Container(
                color: Colors.greenAccent,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '69',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
                ),
              ),
            ),
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.feedback_outlined,size: 20,
              color: Colors.indigoAccent,),
            title: Text('Send feedback Us'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined,size: 20,
              color: Colors.indigoAccent,),
            title: Text('Our Privacy policy'),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app_rounded,size: 20,
              color: Colors.indigoAccent,),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
//
// 
