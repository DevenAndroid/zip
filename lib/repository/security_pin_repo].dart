import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_registor.dart';
import '../models/model_security_pin.dart';
import '../models/model_update_password.dart';
import '../models/set_transfre_limit_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelSecurityPin> securityPinRepo({context,pin,}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};


  map['pin'] = pin;






  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.verifyPinSecurity),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSecurityPin.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSecurityPin(message: jsonDecode(response.body)["message"],status: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}