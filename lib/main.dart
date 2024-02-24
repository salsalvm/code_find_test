import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map Highlighting'),
        ),
        body: const MapWidget(),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  GoogleMapController? mapController;

  // Your list of coordinates
  List<LatLng> coordinateList = [
   const LatLng(1.323957439, 103.8728576),
    const LatLng(1.319535712, 103.8750668),
    const  LatLng(1.363519886, 103.905394),
      const LatLng(1.357098686, 103.902042),
    //const Add more LatLng objects as needed
  ];

  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (LatLng coordinate in coordinateList) {
      markers.add(
        Marker(
          markerId: MarkerId(coordinate.toString()),
          position: coordinate,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: 'Highlighted Location'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition:  CameraPosition(
          target: coordinateList[0],
          zoom: 10.0,
        ),
        markers: markers.toSet(),
      ),
    );
  }
}