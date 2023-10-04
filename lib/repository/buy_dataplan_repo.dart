import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_buy_interNet.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelBuyInternet> BuyDataPlanRepo({  amount,phone_no,telco,data_code,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['amount'] = amount;
  map['phone_no'] = phone_no;
  map['telco'] = telco;
  map['data_code'] = data_code;
  http.Response response = await http.post(Uri.parse(ApiUrls.purchaseData),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "secret-key": details.secretKey,
        "api-key": details.apiKey,

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {

    Helpers.hideLoader(loader);
    return ModelBuyInternet.fromJson(jsonDecode(response.body),);
  } else {

    Helpers.hideLoader(loader);
    return ModelBuyInternet(
        message: jsonDecode(response.body)["message"],success: false
    );
  }
}
