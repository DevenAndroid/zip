 import 'dart:io';
 import 'dart:ui';

 import 'package:fluttertoast/fluttertoast.dart';
 import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/common_colour.dart';




 class ApiUrls {
   static const String apiBaseUrl = 'https://api.flutterwave.com/v3/';
   static const String otps = "${apiBaseUrl}otps";
   static const String verifyOtp = "${apiBaseUrl}otps/";

 }

 Future getAuthHeader() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   // pref.getString("cookie")!.toString().replaceAll('\"', '');
   return {
   HttpHeaders.contentTypeHeader: 'application/json',
   HttpHeaders.acceptHeader: 'application/json',
     HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
     // if(pref.getString("cookie") != null)
     //   HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
   };
 }
 // HttpHeaders.contentTypeHeader: 'application/json',
 // HttpHeaders.acceptHeader: 'application/json',
 //     HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',

 showToast(message) {
   Fluttertoast.cancel();
   Fluttertoast.showToast(
       msg: message,
       toastLength: Toast.LENGTH_LONG,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: AppTheme.secondaryColor,
       textColor: Color(0xffffffff),
       fontSize: 14);
 }