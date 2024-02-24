import 'package:camera_finder/controller/map_controller.dart';
import 'package:camera_finder/res/colors.dart';
import 'package:camera_finder/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleMapController? mapController;
    final HomeControler controller = Get.find<HomeControler>();
    controller.addMarkers(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Date',
          style: KStyle.title(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: controller.coordinateList[0],
                zoom: 10.0,
              
              ),
              indoorViewEnabled: true,
              trafficEnabled: true,
              markers: controller.markers.toSet(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0) ,
            decoration: BoxDecoration(color: kBlue,borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {  controller.addMarkers(context);     },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Fetch Latest Camera Details',style: KStyle.heading(color: kWhite),),
              ),
            ),
          )
        ],
      ),
             
    );
  }
}
