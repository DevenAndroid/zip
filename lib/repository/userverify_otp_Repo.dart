import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_registor.dart';
import '../models/model_userverify_otp.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<UserVerifyOtpModel> userVerifyOtpRepo({phone_email,context,otp}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['phone_email'] = phone_email;
  map['otp'] = otp;


  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.userVerifyOtp),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return UserVerifyOtpModel.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return UserVerifyOtpModel(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}