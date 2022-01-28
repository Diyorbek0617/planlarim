import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planlarim/model/post_model.dart';
import 'package:planlarim/services/prefs_service.dart';
import 'package:planlarim/services/rtdb_service.dart';
import 'package:planlarim/services/stor_service.dart';

class Add_post extends StatefulWidget {
  const Add_post({Key key}) : super(key: key);
  static final String id="add_post";

  @override
  _Add_postState createState() => _Add_postState();
}

class _Add_postState extends State<Add_post> {
  var isLoading = false;
  File _image;
  final picker = ImagePicker();

  var firstnamecontroller=TextEditingController();
  var lastnamecontroller=TextEditingController();
  var datecontroller=TextEditingController();
  var contentcontroller=TextEditingController();
  //add post
  AddPost()async{
    setState(() {
      isLoading = true;
    });
    String firstname=firstnamecontroller.text.toString().trim();
    String lastname=lastnamecontroller.text.toString().trim();
    String date=datecontroller.text.toString().trim();
    String content=contentcontroller.text.toString().trim();
    if(firstname.isEmpty||lastname.isEmpty||content.isEmpty||date.isEmpty) return;
    if(_image == null) return;

    _apiUploadImage(firstname,lastname,content,date);
  }
// upload image
  void _apiUploadImage(String firstname,String lastname, String content,String date) {

    StoreService.uploadImage(_image).then((img_url) => {
      _apiaddpost(firstname,lastname, content,date, img_url),
    });
  }

  _apiaddpost(String firstname,String lastname,String content, String date, String img_url)async{
    var id=await Prefs.loadUserId();
    RTDBService.addPost( Post(id.toString(), firstname,lastname, content,date,img_url)).then((responce) => {
      _respAddPost(),
    });
  }
// responce add post
  _respAddPost(){
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop({"data":"done"});
  }
  //get image
  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add Post",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      height: 100,
                      width: 100,
                      child:  _image != null ?
                      Image.file(_image,fit: BoxFit.cover)
                          :Image.asset("assets/images/camera.png",fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 15,),
                  // textfield firstname
                  TextField(
                    controller: firstnamecontroller,
                    decoration: InputDecoration(
                      hintText: "Firstname",
                    ),
                  ),
                  SizedBox(height: 15,),
                  // textfield lastname
                  TextField(
                    controller: lastnamecontroller,
                    decoration: InputDecoration(
                      hintText: "Lastname",
                    ),
                  ),
                  SizedBox(height: 15,),
                  // textfield content
                  TextField(
                    controller: contentcontroller,
                    decoration: InputDecoration(
                      hintText: "Content",
                    ),
                  ),
                  SizedBox(height: 15,),
                  // textfield date
                  TextField(
                    controller: datecontroller,
                    decoration: InputDecoration(
                      hintText: "Date",
                    ),
                  ),
                  SizedBox(height: 15,),
                  // button add func
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: FlatButton(
                      onPressed: AddPost,
                      color: Colors.red,
                      child: Text("Add",style: TextStyle(color: Colors.white,),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // circle indicator
          isLoading? Center(
            child: CircularProgressIndicator(),
          ): SizedBox.shrink(),
        ],
      ),
    );
  }
}
