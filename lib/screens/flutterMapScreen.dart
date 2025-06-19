import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class Fluttermapscreen extends StatefulWidget {
   Fluttermapscreen({super.key,required this.CurrentLocation});

  final LatLng CurrentLocation;

  @override
  State<Fluttermapscreen> createState() => _FluttermapscreenState();
}
final GlobalKey<_FluttermapscreenState> mapKey = GlobalKey();
class _FluttermapscreenState extends State<Fluttermapscreen> {
 LatLng initial=LatLng(9.9312,76.2673);
 late final MapController _mapController;

  @override
  void initState(){
    super.initState();
_mapController=MapController();
  }



void moveCurrent(LatLng location){
  _mapController.move(location, 15);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            
            initialCenter:widget.CurrentLocation,
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
                point: widget.CurrentLocation, child: Icon(Icons.location_pin,color: Colors.red,))
            ])
          
        ]),
        
       
        ]
      ),
    );
  }
}