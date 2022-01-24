import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

class _listState extends State<UserList> {
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    final query = _databaseReference.child("UserInfo");
    return Scaffold(
     body: FirebaseAnimatedList(
       query: query,
       itemBuilder: (context,snapshot,animation,index){
         return Card(
           child: ListTile(
             leading: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"),
             title: Text(snapshot.child("name").value.toString(),style: TextStyle(fontSize: 30),),
             subtitle: Text(snapshot.child("email").value.toString()+"\n"+snapshot.child("phn").value.toString(),style: TextStyle(fontSize: 20),),
             trailing:PopupMenuButton(
               itemBuilder: (context) => [
                 PopupMenuItem(
                   child:Row(
                     children: [
                       Icon(
                         Icons.call,
                         color: Colors.indigoAccent,
                         size: 22.0,
                       ),
                       SizedBox(width: 10,),
                       Text("Call")
                     ],
                   )

                 ),
                 PopupMenuItem(
                   child: Row(
                     children: [
                       Icon(
                         Icons.message,
                         color: Colors.blue,
                         size: 22.0,
                       ),
                       SizedBox(width: 10,),
                       Text("Message")
                     ],
                   ),

                 ),

               ],
             ),
           ),
         );
       },
     ),
    );
  }
}
