import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: imageFile==null?InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://discountseries.com/wp-content/uploads/2017/09/default.jpg",

                    ),
                    maxRadius: 30,
                  ),
                  onTap: ()async{
                    PickedFile? pi = await ImagePicker().getImage(source: ImageSource.gallery);
                    if(pi != null){
                      imageFile = File(pi.path);
                    }
                  },
                ):Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(
                          imageFile!,
                      ),
                      maxRadius: 30,
                    ),
                    RaisedButton(onPressed: (){
                      uploadImagetoFirebase(imageFile!);
                    },
                      child: Text("Save"),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "email"
                ),
              ),
            ),
            RaisedButton(color: Colors.green,onPressed: (){},child: Text("Save"),)
          ],
        ),
      ),
    );
  }
}

uploadImagetoFirebase(File imageFile) {

}
