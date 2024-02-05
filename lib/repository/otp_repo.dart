import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_registor.dart';
import '../models/model_otp.dart';
import '../models/model_userverify_otp.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelOtp> userOtpRepo({
  email,
}) async {
  var map = <String, dynamic>{};

  map['email'] = email;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.otpUsers),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return ModelOtp.fromJson(jsonDecode(response.body));
  } else {
    print(jsonDecode(response.body));
    return ModelOtp(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // catch (e) {

// return  UserVerifyOtpModel(message: e.toString(), status: false);
// }
}
