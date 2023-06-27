import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelVerifyOtp> verifyOtpRepo({otp,context, required String refrence}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['otp'] = otp;



  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.verifyOtp+refrence),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelVerifyOtp.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelVerifyOtp(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
