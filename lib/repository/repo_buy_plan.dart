import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelBuy> BuyPlanRepo({  amount,phone_no,telco,reference}) async {

  var map = <String, dynamic>{};
  map['amount'] = amount;
  map['phone_no'] = phone_no;
  map['telco'] = telco;
  map['reference'] = reference;
  http.Response response = await http.post(Uri.parse(ApiUrls.purchase),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "secret-key": "Fincra_SECRETDMVA1HLKTFYE4"

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {


    return ModelBuy.fromJson(jsonDecode(response.body),);
  } else {


    return ModelBuy(
        message: jsonDecode(response.body)["message"],success: false
    );
  }
}
