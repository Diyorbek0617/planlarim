import 'package:flutter/material.dart';
import 'package:planlarim/pages/information/text.dart';

class Telegram_tarixi extends StatefulWidget {
  const Telegram_tarixi({Key key}) : super(key: key);
  static final String id="telegram_tarixi";

  @override
  _Telegram_tarixiState createState() => _Telegram_tarixiState();
}

class _Telegram_tarixiState extends State<Telegram_tarixi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title:
        Text('Telegram tarixi', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,width: double.infinity,
            color: Colors.teal,
            child: Image.asset("assets/images/history.jpg",fit: BoxFit.none,),
          ),
          ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset("assets/images/t_t.png",fit: BoxFit.cover,),
              ),
              Container(
                padding: EdgeInsets.only(top: 8,left: 3,right: 3,bottom: 2),
                child: Text(matnlar().telegram_tarixi(),style: TextStyle( color: Colors.black54,fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}