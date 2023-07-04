import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_registor.dart';
import '../models/verify_africa.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelVerifyAfrica> verifyRepo({phone_email,context,selfie,fname,lname,dob,bvn}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['phone_email'] = phone_email;
  map['selfie'] = selfie;
  map['fname'] = fname;
  map['lname'] = lname;
  map['dob'] = dob;
  map['bvn'] = bvn;




  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.verificationAfrica),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );
  print(response.body);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return ModelVerifyAfrica.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelVerifyAfrica(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}