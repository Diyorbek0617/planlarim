import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:planlarim/pages/account.dart';
import 'package:planlarim/posts/post_home.dart';
class Home_screen extends StatefulWidget {
 // const Home_screen({Key key}) : super(key: key);
  static final String id="home_screen";
  final GlobalKey<FabCircularMenuState> _key =GlobalKey();

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    final primaryColor=Theme.of(context).primaryColor;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue,Colors.teal,Colors.green,Colors.lightGreenAccent],
          ),
        ),
        child: CircularParticle(
          width: w,
          height: h,
          awayRadius: w / 5,
          numberOfParticles: 150,
          speedOfParticles: 1.5,
          maxParticleSize: 7,
          particleColor: Colors.white.withOpacity(.7),
          awayAnimationDuration: Duration(milliseconds: 600),
          awayAnimationCurve: Curves.easeInOutBack,
          onTapAnimation: true,
          isRandSize: true,
          isRandomColor: false,
          connectDots: true,
          enableHover: true,
          hoverColor: Colors.black,
          hoverRadius: 90,
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          alignment: Alignment.bottomRight,
          //key:_key,
          ringColor: Colors.blue.withAlpha(40),
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          fabColor: Colors.white,
          fabOpenIcon: Icon(Icons.menu, color: primaryColor),
          fabCloseIcon: Icon(Icons.close, color: primaryColor),
          fabMargin: const EdgeInsets.only(left:16.0,right: 16,bottom:16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {

          },
          children: <Widget>[

            RawMaterialButton(
              onPressed: () {
              },

              shape: CircleBorder(),
              child:
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("Ma`lumot"),
                          content:  new Text("Yangilangan versiya mavjud emas!!!",style: TextStyle(fontSize: 12,color: Colors.black),),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: new Text("ok"),),
                          ],
                        ) ;
                      }
                  );
                },
                color: Colors.indigoAccent.withAlpha(100),
                child:Text("Updated",style: TextStyle(fontSize: 13,color: Colors.black87,fontWeight: FontWeight.bold),
                  // child: Icon(Icons.account_circle_sharp, color: Colors.green,
                ),
              ),
            ),

            RawMaterialButton(

              onPressed: () {
              },
              shape: CircleBorder(),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("Ma`lumot"),
                          content:  new Text("Account sahifasi demo versiya!!!",style: TextStyle(fontSize: 12,color: Colors.black),),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                                Navigator.pushNamed(context, Account.id);

                              },
                              child: new Text("kirish"),),
                          ],
                        ) ;
                      }
                  );
                },
                color: Colors.tealAccent.withAlpha(100),
                child:Text("Account",style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),
                  // child: Icon(Icons.account_circle_sharp, color: Colors.green,
                ),
              ),
            ),
            RawMaterialButton(

              onPressed: () {
              },
              shape: CircleBorder(),
              child:  FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("Ma`lumot"),
                          content:  new Text("Postlar sahifasi demo versiyada!",style: TextStyle(fontSize: 12,color: Colors.black),),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                                Navigator.pushNamed(context, Post_home.id);
                              },
                              child: new Text("kirish"),),
                          ],
                        ) ;
                      }
                  );
                },
                color: Colors.white70,
                child:Text("Posts",style: TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.bold),
                  // child: Icon(Icons.account_circle_sharp, color: Colors.green,
                ),
              ),
            ),

            RawMaterialButton(
              onPressed: () {
              },
              shape: CircleBorder(),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("Ma`lumot"),
                          content:  new Text("Feedback sahifasi mavjud emas!!!",style: TextStyle(fontSize: 12,color: Colors.black),),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: new Text("ok"),),
                          ],
                        ) ;
                      }
                  );
                },
                color: Colors.white30,
                child:Text("Feedback",style: TextStyle(fontSize: 13,color: Colors.red[300],fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  @override
  void _showSnackBar(BuildContext context, String message)
  {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
