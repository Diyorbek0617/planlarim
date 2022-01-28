
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planlarim/pages/account.dart';
import 'package:planlarim/pages/information/telegram_asoschisi.dart';
import 'package:planlarim/pages/information/telegram_tarixi.dart';
import 'package:planlarim/pages/information/telegram_turlari.dart';
import 'package:planlarim/pages/signin_page.dart';
import 'package:planlarim/pages/signup_page.dart';
import 'package:planlarim/posts/add_post.dart';
import 'package:planlarim/posts/post_home.dart';
import 'package:planlarim/screens/about_screen.dart';
import 'package:planlarim/screens/contents_screen.dart';
import 'package:planlarim/screens/main_screen.dart';
import 'package:planlarim/services/prefs_service.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  Widget _strartPage(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          Prefs.saveUserId(snapshot.data.uid);
          return Main_screen();
        }else{
          Prefs.removeUserId();
          return Sign_up();
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase demo',

      home: _strartPage(),
      routes: {
        Sign_in.id:(context)=>Sign_in(),
        Sign_up.id:(context)=>Sign_up(),
        Main_screen.id:(context)=>Main_screen(),
        Contents_screen.id:(context)=>Contents_screen(),
        About_screen.id:(context)=>About_screen(),
        //information
        Telegram_tarixi.id:(context)=>Telegram_tarixi(),
        Telegram_asoschisi.id:(context)=>Telegram_asoschisi(),
        Telegram_turlari.id:(context)=>Telegram_turlari(),
        // account
        Account.id:(context)=>Account(),
        // post
        Add_post.id:(context)=>Add_post(),
        Post_home.id:(context)=>Post_home(),
      },
    );
  }
}