import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quickspot/screens/parkingDetailes.dart';

class NearmeparkingCard extends StatelessWidget {
  final String  name;
  final String place;
  final VoidCallback? ontap;
  final  String pic;
   NearmeparkingCard({super.key, required this.name,required this.place,this.ontap,required this.pic});

  @override
  Widget build(BuildContext context) {
    return  Card(
                  shadowColor: Colors.black,
                  elevation: 5,
                  color: Colors.white,
                   child: ListTile(
                    trailing: SizedBox(
                      width: 96,
                      height: 90,
                      child: IconButton(onPressed: ontap
                       
                                      
                      ,  icon: Icon(Icons.navigation_rounded,color: Colors.blue,)),
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(pic),fit: BoxFit.fill),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: 80,
                      width: 60,
                      ),
                    title:Text(name) ,
                    subtitle: Text(place),
                   ),
                 );
  }
}