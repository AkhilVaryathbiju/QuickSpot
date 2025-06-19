import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickspot/screens/flutterMapScreen.dart';
import 'package:quickspot/screens/parkingDetailes.dart';
import 'package:quickspot/widgets/nearmeParking.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  TextEditingController _searchController=TextEditingController();
Future<void>searchlocationn()async{
  try{
    String query=_searchController.text;
    if(query.isEmpty)
    return;
List<Location>locations=await locationFromAddress(query);
if(locations.isNotEmpty){
  final loc=locations.first;
  LatLng searchedlocation=LatLng(loc.latitude, loc.longitude);
  setState(() {
    _currentLoction=searchedlocation;
  });
  mapKey.currentState?.moveCurrent(searchedlocation);
}

  }catch(e){
    print('Search error$e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Search location not found')));

  }
}


LatLng _currentLoction= LatLng(9.9312, 76.2673);


Future<void>_updateCurrentLocation()async{
  try{
    Position position=await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation
    );
    setState(() {
      _currentLoction=LatLng(position.latitude, position.longitude);
    });

  }catch(e){
print('Error$e');
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.green,
        title: Image.asset('assets/images/logo.png',scale: 3,),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 215,top: 10),
                      //   child: Text('Current Location',style: TextStyle(color: Colors.black,fontSize: 12),),
                      // ),
                      // Row(mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     SizedBox(width: 230,),
                      //     Icon(Icons.location_on,color: Colors.black,size: 20,),
                      //     Text('Kochi,Eranakulam',style: TextStyle(color: Colors.black),),
                      //   ],
                      // ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Text('Find your \nparking',style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          SizedBox(
                            width: 280,
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                              suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){
                                searchlocationn();
                              },),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: '  Search Location...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.black)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.black)
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15)
                              )
                            ),),
                          ),
                          SizedBox(width: 25,),
                          IconButton(icon: Icon(Icons.my_location_sharp,color: Colors.white),
                          onPressed: ()async {
                            await
                            _updateCurrentLocation();
                            mapKey.currentState?.moveCurrent(_currentLoction);
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(height: 600,
              child: Container(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 245),
                      child: Text('Nearest Parking'),
                    ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:Column(
                  children: [
                    NearmeparkingCard(name: 'Centro parking', place: 'High court ,Eranakulam', pic: 'assets/images/parking1.jpg',ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ParkingdetailesPage()));
                    },),
                    NearmeparkingCard(name: 'Penta Parking', place: 'Menaka,Eranakulam', pic: 'assets/images/parking2.jpg'),
                    NearmeparkingCard(name: 'Travis Parking', place: 'MG road,Eranakulam', pic: 'assets/images/parking3.jpg'),
                 NearmeparkingCard(name: 'Prestige Parking', place: 'Eranakulam', pic: 'assets/images/parking4.jpg'),
                   SizedBox(height: 10,),
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      
                      child: Fluttermapscreen(
                        key: mapKey,
                        CurrentLocation: _currentLoction,),
                    )
                  ],
                 )
               )
                    
                  ],
                ),
                color: Colors.white,
              ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}


