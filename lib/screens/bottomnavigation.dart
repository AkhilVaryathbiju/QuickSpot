import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickspot/screens/accounUi.dart';
import 'package:quickspot/screens/flutterMapScreen.dart';
import 'package:quickspot/screens/home.dart';
import 'package:quickspot/screens/mapPage.dart';
import 'package:quickspot/screens/mapScreen.dart';

class BottomnavigationPage extends StatefulWidget {
  const BottomnavigationPage({super.key});

  @override
  State<BottomnavigationPage> createState() => _BottomnavigationPageState();
}

class _BottomnavigationPageState extends State<BottomnavigationPage> {
  int currentIndex=0;
  int index=0;
  var pages=[
    homeScreen(),
    mapPage(),

    AccounuiPage()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(currentIndex!=0){
setState(() {
  currentIndex=0;
});
return false;
        }
        return true;
        
      },
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.green,
          currentIndex: currentIndex,
          onTap: (int value) {
            setState(() {
             currentIndex=value;
            });
          },
          
          
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'Home',backgroundColor: Colors.green,),
          BottomNavigationBarItem(icon: Icon(Icons.map,color: Colors.white,),label: 'Map',backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,),label:'account' ,backgroundColor: Colors.green)
        ]),
      ),
    );
  }
}