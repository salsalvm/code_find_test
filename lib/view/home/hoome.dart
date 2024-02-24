import 'package:camera_finder/controller/map_controller.dart';
import 'package:camera_finder/res/colors.dart';
import 'package:camera_finder/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapController? mapController;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
  const currentLocation= LatLng(1.29531332, 103.871146);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Real time camer details',
          style: KStyle.title(),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeControler>(
        init: HomeControler(),
        builder: (contr) => contr.internet==false?Center(child: Text('No internet',style: KStyle.heading(),))
            : contr.loading.value? const Center(
                  child: CircularProgressIndicator(
                  color: kSplashColor,
                ),): Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: GoogleMap(
                      onMapCreated: (controller) {
                        mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target:contr.cameraInfoList.isEmpty?currentLocation: LatLng(contr.cameraInfoList[0].location.latitude,
                            contr.cameraInfoList[0].location.longitude),
                        zoom: 10.5,
                      ),
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                    
                      indoorViewEnabled: true,
                      trafficEnabled: true,
                      markers: contr.markers.toSet(),
                    ),
                  ),
              Visibility(visible: contr.cameraInfoList.isEmpty,
                child:  Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue.shade400,
                )),
              )
              ],
            ),
      ),
    );
  }
}
