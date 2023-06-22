import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelCommonResponse> loginUserRepo({name,email,context,phone}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map1 = <String, dynamic>{};
  map['length'] = 7;
  map['customer'] = map1;

  map1['name'] = name;
  map1['email'] = email;
  map1['phone'] = phone;
  map['sender'] = "Example Business";
  map['send'] = true;
  map['medium'] =  ["email"];
  map['expiry'] = "5";


  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.otps),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelCommonResponse.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelCommonResponse(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
