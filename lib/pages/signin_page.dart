import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planlarim/pages/signup_page.dart';
import 'package:planlarim/screens/main_screen.dart';
import 'package:planlarim/services/auth_service.dart';
import 'package:planlarim/services/prefs_service.dart';
import 'package:planlarim/services/utills_service.dart';

class Sign_in extends StatefulWidget {
 // const Sign_in({Key key}) : super(key: key);
  static final String id="signin_page";
  String names='';
  Sign_in({this.names});
  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  bool isloading=false;
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  _dosign_in(){
    String email=emailcontroller.text.toString().trim();
    String password=passwordcontroller.text.toString().trim();
    if(email.isEmpty|| password.isEmpty)return;
    setState(() {
      isloading=true;
    });
    AuthService.signInUser(context, email, password).then((firebaseUser) => {
      _getfirebaseUser(firebaseUser),
    });

  }
  _getfirebaseUser(FirebaseUser firebaseUser)async{
    setState(() {
      isloading=false;
    });
    if(firebaseUser!=null){
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, Main_screen.id);
    }
    else{
      Utils.fireToast("Check your email or pssword");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                    onPressed: (){
                      _dosign_in();
                    },
                    color: Colors.red,
                    child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 16),),
                      SizedBox(width: 8,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, Sign_up.id);
                          },
                          child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 16),)),
                    ],
                  ),
                ],
              ),
            ),
            isloading==true?
            Center(
              child: CircularProgressIndicator(),
            ):SizedBox.shrink(),
          ],
        )
    );
  }
}
