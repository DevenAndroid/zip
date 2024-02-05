import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/buy_cabel_model.dart';
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_buy_interNet.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

final details = Get.put(DetailsController());

Future<BuyCabelTvModel> BuyCabelRepo(
    {amount,
    key,
    serviceID,
    phone,
    billersCode,
    variation_code,
    subscription_type,
      data_code,
telcos,
    context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['amount'] = amount;
  map['data_code'] = data_code;
  map['telcos'] = telcos;
  map['key'] = key;
  map['serviceID'] = serviceID;
  map['phone'] = phone;
  map['billersCode'] = billersCode;
  map['variation_code'] = variation_code;
  map['subscription_type'] = subscription_type;
  http.Response response = await http.post(Uri.parse(ApiUrls.serviceCommon),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return BuyCabelTvModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);

    return BuyCabelTvModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
}
