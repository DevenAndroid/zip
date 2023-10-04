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
import '../models/model_create_card.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelCreateCard> createCardRepo(
    {cardholder_id, card_type, card_brand, card_currency}) async {
  var map = <String, dynamic>{};
  map['cardholder_id'] = cardholder_id;
  map['card_type'] = card_type;
  map['card_brand'] = card_brand;
  map['card_currency'] = card_currency;
log(map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.createCard),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "token": details.testToken
      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return ModelCreateCard.fromJson(
      jsonDecode(response.body),
    );
  } else {
    return ModelCreateCard(
        message: jsonDecode(response.body)["message"],
        status: false.toString());
  }
}
