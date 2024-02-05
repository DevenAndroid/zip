import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../models/service_buy_model.dart';
import '../models/service_common_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

Future<ServiceBuyModel> commonBuyRepo(
    {key, serviceID, variation_code, telcos,data_code,billersCode, amount, phone,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['key'] = key;
  map['serviceID'] = serviceID;
  map['variation_code'] = variation_code;
  map['telcos'] = telcos;
  map['data_code'] = data_code;

  map['amount'] = amount;
  map['billersCode'] = billersCode;
  map['phone'] = phone;
  http.Response response = await http.post(Uri.parse(ApiUrls.serviceCommon),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    // print(jsonDecode(response.body));
    return ServiceBuyModel.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    // print(jsonDecode(response.body));
    return ServiceBuyModel(
      message: jsonDecode(response.body)["message"],
    );
  }
}
