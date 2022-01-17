import 'package:flutter/material.dart';
import 'package:student_info/dashboard.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<AddData> {
  final ctrlName = TextEditingController();
  final ctrlRoll = TextEditingController();
  final ctrlclass = TextEditingController();
  final ctrlemail = TextEditingController();
  final ctrlphn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data "),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrlName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Studnet Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrlRoll,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Student Roll"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrlclass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Student class"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrlemail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter student Email"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrlphn,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter student phn number"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text("Save"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Dashboard())
                  );
                  addDatatoDatabase(ctrlName.text,ctrlRoll.text,ctrlclass.text,ctrlemail.text,ctrlphn.text);
                },
              )
            ),

          ],
        ),
      ),
    );
  }
}

addDatatoDatabase(String name, String roll, String studentClass, String email, String phn) {

}

//Mui Rasel Hassan, mui sry mui kono kaj korte pari nai, mui antorik vabe dukhito...
