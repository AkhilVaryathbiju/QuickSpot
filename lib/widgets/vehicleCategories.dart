import 'package:flutter/material.dart';

class VehicleCategory extends StatelessWidget {
   final String? imgURl;
   VehicleCategory({super.key,  this.imgURl});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        image: DecorationImage(image: AssetImage('$imgURl'))
      ),
    );
  }
}