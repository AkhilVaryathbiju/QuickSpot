

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;


class MapscreenPage extends StatefulWidget {
  const MapscreenPage({super.key});

  @override
  State<MapscreenPage> createState() => _MapscreenPageState();
}

class _MapscreenPageState extends State<MapscreenPage> {
  late final MapController _mapControl;
int timeleft=20;
Duration updateinterval=Duration(seconds: 30);
bool navigationStarted =false;
int Currentroute=0;
LatLng?movingVehicleposition;
double? routedistance;
  double? routeDuration;


final LatLng userLocation=LatLng(9.9312, 76.2673);
final LatLng parkinLoaction = LatLng(9.9674, 76.242);

List <LatLng> routePoints=[];
List<LatLng>movinpoints=[];



@override
void initState(){
  super.initState();
 
  _mapControl=MapController();
fetchRoute().then((_){
    WidgetsBinding.instance.addPostFrameCallback((_){
_startModalsheet();
  });
});
}
void startTimer(){
  Future.doWhile(()async{
    await Future.delayed(updateinterval);
    if(timeleft>0){
      setState(() {
        timeleft--;
      });
      return true;

    }
    return false;
  });
}



void _startModalsheet(){
  showModalBottomSheet(
    
    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(15)
    ),
    context: context, builder: (_){
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.25,
      maxChildSize: 0.8,
      builder: (_,controller){
      return Padding(padding: EdgeInsets.all(20),
      child:ListView(
        controller: controller,
        children: [
          Center(
            child: Container(
              height: 10,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                
              ),
              
            ),
          ),
          Text('Start Moving'),
        if(routeDuration!=null&&routedistance!=null)
        Text('Distance:${routedistance!.toStringAsFixed(2) } km :${routeDuration!.toStringAsFixed(0)}mins'),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue
          ),
          
          onPressed: (){
          Navigator.pop(context);
          setState(() {
            
            navigationStarted=true;
            timeleft=routeDuration!.toInt();
            Currentroute=0;
          });
          startTimer();
          startMoving();
          
        }, label: Text('Start',style: TextStyle(color: Colors.white),))
        ],                                                                          
      ));
    });
  });
}

void startMoving(){
  
  Future.doWhile(()async{
    await Future.delayed(updateinterval);
    if(Currentroute<routePoints.length){
      setState(() {
        movingVehicleposition=routePoints[Currentroute];
        Currentroute++;
      });
      _mapControl.move(movingVehicleposition!, 15);
return true;
    }
    return false;
  });
}


Future <void>fetchRoute()async{

  final url =Uri.parse('https://router.project-osrm.org/route/v1/driving/${userLocation.longitude},${userLocation.latitude};${parkinLoaction.longitude},${parkinLoaction.latitude}?overview=full&geometries=geojson');

  final response=await http.get(url);
  if(response.statusCode==200){
    final data = jsonDecode(response.body);
    final coords= data['routes'][0]['geometry']['coordinates'];
setState(() {
   routePoints = coords
        .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
        .toList();
        
        movinpoints=List.from(routePoints);
 
  routedistance=data['routes'][0]['distance']/1000;
  routeDuration=(data['routes'][0]['duration']/60);
   timeleft=routeDuration!.toInt();
});

startTimer();
  }else{
    Text('Failed to load the route');
  }
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ FlutterMap(
          mapController: _mapControl,
          options: MapOptions(
            initialCenter: userLocation,
            initialZoom: 15
          ),
          children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a','b','c'],
        ),
        if(movingVehicleposition!=null)
        MarkerLayer(markers: [
          Marker(
            height: 60.0,
            point: movingVehicleposition!, child: Icon(Icons.directions_car_filled,color: Colors.red,))
        ]
        
        
        ),
        MarkerLayer(markers: [
          
          Marker(
            height: 60.0,
            point: userLocation, child: Icon(Icons.location_on,color: Colors.red,))
        ]),
        if(routePoints.isNotEmpty)
        PolylineLayer(polylines: [
        Polyline(points: routePoints,
        strokeWidth: 4.0)
        ])
        
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child:Padding(
              padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
CircleAvatar(
  backgroundColor: Colors.white12,
  child: Icon(Icons.car_repair_outlined,color: Colors.red,),
),
                      Text('$timeleft min',style: TextStyle(
  fontSize: 20,
  color: Colors.green,
  fontWeight: FontWeight.bold
),),
CircleAvatar(
  backgroundColor: Colors.white,
  child: IconButton(onPressed: (){
Navigator.pop(context);
  }, icon: Icon(Icons.cancel,color: Colors.black,)),
)
                  ],
                ),
                height: 90,
                width: 500,
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 9
                  )
                ],
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            )
          )
          
          ]
      ),
    );
  }
}

