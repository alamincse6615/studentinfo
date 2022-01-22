import 'package:flutter/material.dart';
import 'package:student_info/editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://discountseries.com/wp-content/uploads/2017/09/default.jpg",

                  ),
                  maxRadius: 30,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Name",style: TextStyle(fontSize: 25),),
            Text("email",style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));

        },
        child: Icon(Icons.edit,color: Colors.white)

      ),

    );
  }
}
