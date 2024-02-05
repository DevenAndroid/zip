import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/airtime_country_model.dart';
import '../models/airtime_operater_model.dart';
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../models/service_buy_model.dart';
import '../models/service_common_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

Future<AirtimeOperatorModel> commonOperatorRepo(
    {key, code, product_type_id}) async {
  var map = <String, dynamic>{};
  map['key'] = key;
  map['code'] = code;
  map['product_type_id'] = product_type_id;
  // map['serviceID'] = serviceID;
  // map['variation_code'] = variation_code;
  // map['amount'] = amount;
  // map['billersCode'] = billersCode;
  // map['phone'] = phone;
  http.Response response = await http.post(Uri.parse(ApiUrls.serviceCommon),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {
    // print(jsonDecode(response.body));
    return AirtimeOperatorModel.fromJson(jsonDecode(response.body));
  } else {
    // print(jsonDecode(response.body));
    return AirtimeOperatorModel(
      message: jsonDecode(response.body)["message"],
    );
  }
}
