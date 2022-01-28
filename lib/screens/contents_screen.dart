import 'package:flutter/material.dart';
import 'package:planlarim/pages/information/telegram_asoschisi.dart';
import 'package:planlarim/pages/information/telegram_tarixi.dart';
import 'package:planlarim/pages/information/telegram_turlari.dart';
class Contents_screen extends StatefulWidget {
  const Contents_screen({Key key}) : super(key: key);
  static final String id="contents_screen";

  @override
  _Contents_screenState createState() => _Contents_screenState();
}

class _Contents_screenState extends State<Contents_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("assets/images/t7.png"),
            // fit:BoxFit.cover,
            alignment: Alignment.center,
          ),
          gradient: LinearGradient( begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan,Colors.blueAccent,Colors.lightBlueAccent,Colors.indigoAccent],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Card(
              color: Colors.white70,
              margin: EdgeInsets.only(top:8, left: 9,right: 9,bottom: 5),
              elevation: 0,
              child: ListTile(
                onTap:()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Telegram_tarixi()),
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),
                leading:
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/t_h2.jpg',),
                  radius: 19,
                ),
                title: Text('Telegram tarixi',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 15),),
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.only(top:5, left: 9,right: 9,bottom: 5),
              elevation: 0,
              child:ListTile(
                onTap:()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Telegram_asoschisi())
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),

                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Durov.png'),
                  radius: 19,
                ),
                title: Text('Telegram asoschisi',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 15),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.only(top:5, left: 9,right: 9,bottom: 5),
              elevation: 0,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/t_d5.png'),
                  radius: 19,
                ),
                title: Text('Telegram turlari',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 15),
                ),
                onTap: (){
                  Navigator.pushNamed(context, Telegram_turlari.id);
                },
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.only(top:5, left: 9,right: 9,bottom: 5),
              elevation: 0,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/t_up2.png'),
                  radius: 19,
                ),
                title: Text('Telegram versiyalari',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 15),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.only(top:5, left: 9,right: 9,bottom: 5),
              elevation: 0,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/t_alter3.png'),
                  radius: 19,
                ),
                title: Text('Telegram alternatives',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
