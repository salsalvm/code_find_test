import 'package:camera_finder/controller/map_controller.dart';
import 'package:camera_finder/res/colors.dart';
import 'package:camera_finder/view/home/hoome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late Size size;

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    checkUserLogin(context);
    Get.put(HomeControler());
    return Scaffold(
      backgroundColor: kSplashColor,
      body: Center(
        child: Container(
          height: size.height * .5,
          width: size.width * .9,
          decoration: const BoxDecoration(
            color: kSplashColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              image: AssetImage('asset/images/splash.jpeg'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLogin(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ),
    );
  }
}
