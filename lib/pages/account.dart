import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planlarim/pages/signin_page.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);
  static final String id="account";

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File _image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {


    Future _ImageGallery() async {
      final pickedFile = await _picker.getImage(
          source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() => this._image = File(pickedFile.path));
      }
    }

    Future _getImage() async {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Account"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Container(
                  height: 140,
                 width: 140,
                 padding: EdgeInsets.all(1),
                 decoration: BoxDecoration(
                   border: Border.all(width: 1,color: Colors.blueAccent),
                 ),
                  child:_image != null ?
                  Image.file(_image,fit: BoxFit.cover)
                      :Image.asset("assets/images/avatar.png",fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.photo,color: Colors.grey,),
                  onPressed: () async => _getImage(),
                  tooltip: 'Shoot picture',
                ),
                SizedBox(width: 8.0,),
                IconButton(
                  icon: const Icon(Icons.photo_camera,color: Colors.grey,),
                  onPressed: () async => _ImageGallery(),
                  tooltip: 'Pick from gallery',
                ),
              ],
            ),

            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Username",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),),
               // SizedBox(width: 25,),
                Text("Bro enter username!", style: TextStyle(color: Colors.grey, fontSize: 13),),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bio",style: TextStyle(color: Colors.blueAccent,fontSize: 16),),
              //  SizedBox(width: 15,),
                Text("Enter info about yourself!",style: TextStyle(color: Colors.grey,fontSize: 13),),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
