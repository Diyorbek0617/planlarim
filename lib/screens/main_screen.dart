import 'package:flutter/material.dart';
import 'package:planlarim/screens/about_screen.dart';
import 'package:planlarim/screens/home_screen.dart';
import 'package:planlarim/screens/contents_screen.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({Key key}) : super(key: key);
  static final String id="main_screen";

  @override
  _Main_screenState createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  int _currentTap=0;
  PageController _pageController;
  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,

      body:PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _currentTap= index;
          });
        },
        children: <Widget> [
          Home_screen(),
          Contents_screen(),
          About_screen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Bosh menu")),
          BottomNavigationBarItem(icon: Icon(Icons.assignment),title:Text("Mundarija")),
          BottomNavigationBarItem(icon: Icon(Icons.perm_device_information),title:Text("Dastur haqida")),
        ],
        currentIndex: _currentTap,
        onTap:(position) {
          setState(() {
            _currentTap = position;
            _pageController.animateToPage(position,
                duration: Duration(milliseconds: 50), curve: Curves.easeIn);
          },
          );
        },
      ),
    );
  }

}
