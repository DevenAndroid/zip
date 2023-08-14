import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_update_address.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelUpdateAddress> updateAddressRepo({street_name,context,house_number,additional,postal_code,phone,state,city,country}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['street_name'] = street_name;
  map['house_number'] =  house_number;
  map['additional'] = additional;
  map['postal_code'] = postal_code;
  map['state'] = state;
  map['city'] = city;
  map['country'] = country;
  map['phone'] = phone;
  map['is_first_time'] = "1";


  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.userAddress),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelUpdateAddress.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelUpdateAddress(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}