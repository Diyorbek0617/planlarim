import 'package:flutter/material.dart';
import 'package:planlarim/pages/information/text.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://telegram.me/hack_revealing';

class About_screen extends StatefulWidget {
  const About_screen({Key key}) : super(key: key);
  static final String id="about_screen";

  @override
  _About_screenState createState() => _About_screenState();
}

class _About_screenState extends State<About_screen> {

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan,Colors.blueAccent,Colors.lightBlueAccent,Colors.indigoAccent],
          ),
        ),
        child: ListView(
          children: [
            Container(
              color: Colors.black12,
              child: Center(
                child: Text("Telegram ma`lumotlari dasturi haqida",
                  style: TextStyle(
                    fontSize: 24,
                    //fontWeight:FontWeight.bold,
                    fontFamily: "Billabong",
                    color: Colors.black,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 15,),
            ),
            Container(
              height: 160,
              width: double.infinity,
              color: Colors.black12,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Center(child: Image.asset("assets/images/t7.png",fit: BoxFit.cover,),),
                      // margin: EdgeInsets.all(5),
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 3,right: 3,),
              width: double.infinity,
              color: Colors.black12,
              child: Text(matnlar().dastur_haqida(),style: TextStyle(
                fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.justify,
              ),
            ),
            Divider(height: 1,color: Colors.red[900],),

            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.only(right: 50,left: 50),
              height: 50,
              width: double.infinity,
              // color: Colors.black12,
              decoration: BoxDecoration(
               // color: Colors.black12,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.5),
                ),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("Ma`lumot"),
                          content:  new Text(matnlar().boglanish(),style: TextStyle(fontSize: 12,color: Colors.black),),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: (){
                                _launchURL();
                                Navigator.pop(context);
                              },
                              child: new Text("bog'lanish"),),
                            new FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: new Text("chiqish"),),
                          ],
                        ) ;
                      }
                  );

                },
                child: Text("Bog`lanish",style: TextStyle(fontSize:19,color: Colors.red),),
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 8,),
            Divider(height: 1,color: Colors.red[900],),
            Container(
              padding: EdgeInsets.only(top: 10,left: 3,right: 3,),
              height: 40,
              width: double.infinity,
              child: Text(
                "Telegram yaratuvchilari bir suratda joylangan.",style: TextStyle(
                fontSize: 18,color: Colors.black,inherit: true,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(height: 1,color: Colors.red[900],),
            Container(
              height: 400,
              width: double.infinity,
              child: Image(image:AssetImage("assets/images/creators.jpg"),fit: BoxFit.fill,),
            ),
            Container(
              padding: EdgeInsets.only(top: 100,),
              height: 120,
              width: double.infinity,
              color: Colors.black12,
              child: Text("Version   1.0.0.0",style: TextStyle(
                  fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold
              ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
