import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      // if(pref.getInt("role") == 0){
        Get.offAllNamed(MyRouters.onBoardingScreen);
      // }
      // else if(pref.getInt("role") == 1 ){
      //   Get.offAllNamed(MyRouters.);
      // }else{
      //   Get.offAllNamed(MyRouters.);
      // }

    }
    );
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Image.asset((
            'assets/images/Splash Screen.png'
        ),
          fit: BoxFit.fill,),
        ));
  }

}

