// import 'package:flutter/material.dart';
// import 'package:quickspot/screens/SlotBokking.dart';
// import 'package:quickspot/screens/home.dart';
// import 'package:quickspot/screens/mapScreen.dart';




// import 'package:quickspot/screens/parkingDetailes.dart';
// import 'package:quickspot/screens/paymentScreen.dart';



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home:  homeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quickspot/provider/AccountProvider.dart';
import 'package:quickspot/screens/SlotBokking.dart';
import 'package:quickspot/screens/mapPage.dart';
import 'package:quickspot/screens/signUppage.dart';


void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>Accountprovider(),
    ),
    
  ],child: myApp(),));
}
class myApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}