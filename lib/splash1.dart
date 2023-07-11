import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/resourses/api_constant.dart';
import 'package:zip/routers/my_routers.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool enableCheck = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      enableCheck = true;
      userCheck();
    }
    );
  }

  userCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('cookie') != null) {
      if(pref.getBool("finger") != null && pref.getBool("finger") == true){
        bool gg = await authenticate();
        if(gg == false){
          return;
        }
      }
      if (pref.getBool('Enabel') == true) {
        Get.offAllNamed(MyRouters.securityOtpScreen);
      }
      else{
        Get.offAllNamed(MyRouters.bottomNavbar);
      }
      // Get.offAllNamed(MyRouters.bottomNavbar);
    }
    else{
      Get.offAllNamed(MyRouters.onBoardingScreen);
    }
  }

  final LocalAuthentication _localAuthentication = LocalAuthentication();


  Future<bool> authenticate() async {
    if( await _localAuthentication.canCheckBiometrics && await _localAuthentication.isDeviceSupported()){
      bool authenticated = false;
      try {
        authenticated = await _localAuthentication.authenticate(
            localizedReason: 'Please authenticate to access the app.',
            options: const AuthenticationOptions(
                biometricOnly: true,
                useErrorDialogs: true,
                stickyAuth: true,
                sensitiveTransaction: true
            )
        );
        return authenticated;
      } catch (e) {
        // Handle any exceptions that occur during the authentication process.
        print(e);
        return false;
      }
    } else{
      showToast("Please enable your biometric");
      return false;
    }
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: enableCheck ? (){userCheck();} : null,
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Image.asset((
              'assets/images/Splash Screen.png'
          ),
            fit: BoxFit.fill,),
          )),
    );
  }

}

