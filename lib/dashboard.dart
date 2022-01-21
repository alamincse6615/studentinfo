import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:student_info/Mithun/Arrows.dart';
import 'package:student_info/Mithun/List.dart';
import 'package:student_info/Mithun/Studentinfo.dart';
import 'package:student_info/addinfo.dart';
import 'package:student_info/drawer/my_drawer_header.dart';
import 'package:student_info/drawer/grid_search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              borderRadius: BorderRadius.circular(60.0),
            ),
            null,
            0,
          ),
        ),


      body: Column(
        children: [
          Text(auth.currentUser!.uid.toString()),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddData()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.indigoAccent,
        buttonBackgroundColor: Colors.indigoAccent,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          InkWell(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => add(),
                ),
              );
            },
          ),
          InkWell(
            child: Icon(Icons.list, color: Colors.white),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => list(),
                  ));
            },
          ),
          InkWell(
            child: Icon(Icons.compare_arrows, color: Colors.white),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => arrows(),
                  ));
            },
          ),
        ],
      ),
//jisan
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

          menuItem(
            1,
            "Menu",
            Icons.dashboard_outlined,
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.fiber_new_sharp,size: 20,
                color: Colors.indigoAccent,),

            ),
            title: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  'New post',
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 16,
                  ),
                )),
            onTap: () => null,
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Container(
                  color: Colors.greenAccent,
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Text(
                      '69',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          menuItem(
            2,
            "Messages",
            Icons.message,
          ),
          menuItem(
            3,
            "Events",
            Icons.event,
          ),
          menuItem(
            4,
            "Keep Notes",
            Icons.notes,
          ),
          Divider(),
          menuItem(
            5,
            "Notifications",
            Icons.notifications_outlined,
          ),
          menuItem(
            6,
            "Settings",
            Icons.settings_outlined,
          ),
          Divider(),
          menuItem(
            7,
            "Send feedback Us",
            Icons.feedback_outlined,
          ),
          menuItem(
            8,
            "Our Privacy policy",
            Icons.privacy_tip_outlined,
          ),

        ],
      ),
    );
  }

  Widget menuItem(
    int id,
    String title,
    IconData icon,
  ) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.indigoAccent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
