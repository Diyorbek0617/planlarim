import 'package:flutter/material.dart';
import 'package:planlarim/pages/information/text.dart';

class Telegram_asoschisi extends StatefulWidget {
  const Telegram_asoschisi({Key key}) : super(key: key);
  static final String id="telegram_asoschisi";

  @override
  _Telegram_asoschisiState createState() => _Telegram_asoschisiState();
}

class _Telegram_asoschisiState extends State<Telegram_asoschisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(90),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title:
        Text('Telegram asoschisi', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            fontSize: 15),
        ),
      ),

      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.asset("assets/images/Durov2.jpg",fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.only(top: 8,left: 3,right: 3,bottom: 2),
            child: Text(matnlar().telegram_asoschisi(),style: TextStyle( color: Colors.black54,fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4,left: 3,right: 3,bottom: 2),
            height: 230,
            width: double.infinity,
            child: Image.asset("assets/images/Durov4.png",fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }

}
