import 'dart:async';
import 'dart:developer';

import 'package:camera_finder/model/camera_info.dart';
import 'package:camera_finder/res/colors.dart';
import 'package:camera_finder/res/styles.dart';
import 'package:camera_finder/service/map_service.dart';
import 'package:camera_finder/view/home/hoome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class HomeControler extends GetxController {
    Timer? timer;
  List<Marker> markers = <Marker>[];
  List<Camera> cameraInfoList = <Camera>[];
  bool internet = false;
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCameraInfo(getTimeStamp(), true);

   timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      getCameraInfo(getTimeStamp(), false);
    });
  }

  

  getCameraInfo(String timeStamp, bool initial) async {
    internet = true;
    loading.value = initial;
    try {
      final response = await CameraServiceEndPont().getCameraInfo(timeStamp);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = cameraInfoFromJson(response.body);
        cameraInfoList.clear();
        markers.clear();
        update();
        await Future.delayed(const Duration(seconds: 1));
        cameraInfoList.addAll(datas.items[0].cameras);
        addMarkers(initial);
         loading.value = false;
        log('api data size -> ${datas.items[0].cameras.length.toString()}');
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
      internet = false;
    }
    update();
  }

  void addMarkers(bool initial) {
    if (!initial) {Get.back();}
    for (Camera cameraInfo in cameraInfoList) {
      markers.add(
        Marker(
          onTap: () => viewImage(cameraInfo),
          markerId: MarkerId(LatLng(
                  cameraInfo.location.latitude, cameraInfo.location.longitude)
              .toString()),
          position: LatLng(
              cameraInfo.location.latitude, cameraInfo.location.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: ''),
        ),
      );
      update();
    }
  }


  Future<dynamic> viewImage(Camera cameraInfo) {
    return Get.dialog(
        useSafeArea: false,
        Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'asset/images/placeholder.png',
                  placeholderFit: BoxFit.cover,
                  imageErrorBuilder: (BuildContext context, Object error, _) =>
                      Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/images/placeholder.png'),
                      ),
                    ),
                  ),
                  height: 240,
                  width: 320,
                  alignment: Alignment.center,
                  image: cameraInfo.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Camera id : ${cameraInfo.cameraId}',
                  style: KStyle.heading(color: kWhite),
                ),
              ),
            ],
          ),
        ));
  }

  String getTimeStamp() {
    final currentTime = DateTime.now();
    DateTime dateTime = DateTime.parse(currentTime.toString());
    String formattedDateTime =
        DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime);
    log("timestamp -> $formattedDateTime");
    return formattedDateTime;
  }

@override
  void onClose() {
    mapController?.dispose();
    timer?.cancel();
    super.onClose();
  }
}
