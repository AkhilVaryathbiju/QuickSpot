import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';


class mapPage extends StatefulWidget {
   mapPage({super.key});

  
  @override
  State<mapPage> createState() => _mapPageState();
}
final GlobalKey<_mapPageState> mapKey = GlobalKey();
class _mapPageState extends State<mapPage> {
 LatLng initial=LatLng(9.9312,76.2673);
  final MapController _mappController=MapController();
 final TextEditingController searchcontroller =TextEditingController();

  @override
  void initState(){
    super.initState();

  }



void moveCurrent(LatLng location){
  _mappController.move(location, 15);
  setState(() {
    initial=location;
  });
}
Future<void>search()async{
  String query = searchcontroller.text;
  if(query.isNotEmpty){
    try{
      List<Location>locations = await locationFromAddress(query);
      if(locations.isNotEmpty){
        final Locationn=locations.first;
        moveCurrent(LatLng(Locationn.latitude, Locationn.longitude));
      }
    }catch(e){
      throw Text('$e');
    }
  }
}


Future<void>getcurrentLocation()async{
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled=await Geolocator.isLocationServiceEnabled();
  if(!serviceEnabled){
    await Geolocator.openLocationSettings();
    return;
  }
permission=await Geolocator.checkPermission();
if(permission==LocationPermission.denied){
  permission= await Geolocator.requestPermission();
  if(permission==LocationPermission.denied){
    return;
  }
}
if(permission==LocationPermission.deniedForever){
  return;
}
Position position = await Geolocator.getCurrentPosition();
moveCurrent(LatLng(position.latitude, position.longitude));

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ FlutterMap(
          mapController: _mappController,
          options: MapOptions(
            
            initialCenter:initial,
            initialZoom: 10
          ),
          children: [
            
            TileLayer(
              
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(markers: [
             
              Marker(
                
                width: 40,
                height: 40.0,
                point: initial, child: Icon(Icons.location_pin,color: Colors.red,))
            ])
          
        ]),
        Positioned(
          top: 20,
          right: 20,
          left: 20,
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchcontroller,
            onSubmitted: (_)=>search(),
            decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: (){
search();
              }, icon: Icon(Icons.search)),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          ),
        )),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
          child: Icon(Icons.my_location_rounded,color: Colors.black,),
          onPressed: (){
            getcurrentLocation();

        }))
        
       
        ]
      ),
    );
  }
}