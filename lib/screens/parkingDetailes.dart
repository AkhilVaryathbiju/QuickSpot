import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickspot/screens/SlotBokking.dart';
import 'package:quickspot/screens/mapScreen.dart';

class ParkingdetailesPage extends StatefulWidget {
  const ParkingdetailesPage({super.key});

  @override
  State<ParkingdetailesPage> createState() => _ParkingdetailesPageState();
}

class _ParkingdetailesPageState extends State<ParkingdetailesPage> {
var parkImg=[
  'assets/images/parking 5.jpg',
'assets/images/parking9.jpg',
'assets/images/parking7.jpg',
'assets/images/parking3.jpg',
'assets/images/parking4.jpg',
'assets/images/parking2.jpg'
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 180,
            child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30,left: 1),
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new))
        ),
        Column(
          children: [
            SizedBox(height: 50,),
            Text('Centro Parking',style: TextStyle(
        fontSize: 26
            ),),
            Text('Marine Drive,Kochi',
            style: TextStyle(
        fontSize: 16
            ),),
            SizedBox(height: 20,),
            Row(
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,
          color: Colors.yellow,),
           Icon(Icons.star,
          color: Colors.yellow,),
           Icon(Icons.star,
          color: Colors.yellow,)
        ],
            )
            
          ],
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/parking9.jpg'),
            fit: BoxFit.fill)
          ),
        )
            ],
          ),
            ),),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Total 72 slots',style: TextStyle(
                    fontSize: 15
                  ),),
                  
                
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                itemCount: 6,
              
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1)
              , itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(parkImg[index]),fit: BoxFit.fill)
                  ),
                );
              }),
            ),
            SizedBox(height: 5,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   TextButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapscreenPage()));
                   }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.subdirectory_arrow_right_sharp,color: Colors.white,),
                      Text('Directions',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                    ],
                   )),
                
                   
                  ],
                ),
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 200,
              width: 400,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('  Details',style: TextStyle(
                        fontSize: 20
                      ),),
                      Text('  30/Hour'),
                      Text('  Ev charging available'),
                      Text('  Security on site 24/7')
                    ],
                  ),
                ),
                elevation: 8,
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: TextButton(onPressed: (){
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SlotbokkingPage()));
            }, child: Container(
              height: 30,
              width: 200,
              child: Center(child: Text('Go To Booking',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                color: Colors.green
              ),
            )),)
        
          ],
        ),
      ),
    );
  }
}