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
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 224,
              width: MediaQuery.of(context).size.width,
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: imageFile==null?InkWell(
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://discountseries.com/wp-content/uploads/2017/09/default.jpg",

                          ),
                          maxRadius: 80,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed:(){
                            showModalBottomSheet(
                                context: context,
                                builder: (context){
                                  return Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20,),
                                        Text("Choose Image",style: TextStyle(fontSize: 20,color: Colors.blue),),

                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                IconButton(onPressed: ()async{
                                                  PickedFile? pi = await ImagePicker().getImage(source: ImageSource.camera);
                                                  if(pi != null){
                                                   setState(() {
                                                     imageFile = File(pi.path);
                                                   });
                                                  }
                                                }, icon: Icon(Icons.camera)),
                                                IconButton(onPressed: ()async{
                                                  PickedFile? pi = await ImagePicker().getImage(source: ImageSource.gallery);
                                                  if(pi != null){
                                                    setState(() {
                                                      imageFile = File(pi.path);
                                                    });
                                                  }
                                                }, icon: Icon(Icons.image)),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                            );
                          },
                            icon:Icon(
                                Icons.camera_alt,
                                color: Colors.black
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ):Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(
                          imageFile!,
                      ),
                      maxRadius: 80,
                    ),
                    RaisedButton(onPressed: (){
                      uploadImagetoFirebase(imageFile!);
                    },
                      child: Text("Save", style: TextStyle(color: Colors.blueAccent, )),)
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
            RaisedButton(color: Colors.indigoAccent,onPressed: (){

            },child: Text("Save", style: TextStyle(color: Colors.white, )),)
          ],
        ),
      ),
    );
  }
  uploadImagetoFirebase(File imageFile) async{
    fStorage.Reference reference = fStorage.FirebaseStorage.instance.ref().child("StudentPic").child("name");
    fStorage.UploadTask uploadTask = reference.putFile(imageFile);
    fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((value) {
      imageUrl = value;
      print(imageUrl);
    });




  }
}


