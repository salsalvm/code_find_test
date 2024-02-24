import 'dart:developer';

import 'package:camera_finder/model/camera_info.dart';
import 'package:camera_finder/service/map_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeControler extends GetxController{
  
    List<Marker> markers = [];

    // Your list of coordinates
  List<LatLng> coordinateList = [
   const LatLng(1.323957439, 103.8728576),
    const LatLng(1.319535712, 103.8750668),
    const  LatLng(1.363519886, 103.905394),
      const LatLng(1.357098686, 103.902042),
    //const Add more LatLng objects as needed
  ];

  @override
  void onInit() {
    getCameraInfo('');
    super.onInit();
  }

  getCameraInfo(String timeStamp) async {
    try {
      final response = await CameraServiceEndPont().getCameraInfo(timeStamp);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = cameraInfoFromJson(response.body);
        if (datas != null) {
     
     log(datas.items.length.toString());

          update();
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>>>>>.$e<<<<<<<<<<<<<<<<<<');
    }
  }


  void addMarkers(BuildContext ctx) {
    for (LatLng coordinate in coordinateList) {
      markers.add(
        Marker(
          onTap: () {
            _showDialog(ctx);
          },
          markerId: MarkerId(coordinate.toString()),
          position: coordinate,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: 'Highlighted Location'),
        ),
      );
    }
  }

void _showDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Title'),
          content: Column(
            children: [
              Text('This is the content of the dialog.'),
              SizedBox(height: 10),
              Image.network(
                'https://example.com/your_image_url.jpg', // Replace with your image URL
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}