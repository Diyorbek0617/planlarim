import 'package:flutter/material.dart';
import 'package:planlarim/pages/information/text.dart';

class Telegram_turlari extends StatefulWidget {
  const Telegram_turlari({Key key}) : super(key: key);
  static final String id="telegram_turlari";

  @override
  _Telegram_turlariState createState() => _Telegram_turlariState();
}

class _Telegram_turlariState extends State<Telegram_turlari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent[600],
        title: Text("Telegram turlari",style: TextStyle(color: Colors.black,fontSize: 18,),),
      ),
      body: ListView(
        children: [
          Container(
            child: Text(matnlar().telegram_turlari(),style: TextStyle( color: Colors.black54,fontSize: 16),
              textAlign: TextAlign.justify,),
          ),
        ],
      ),
    );
  }
}
