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
    {cardholder_id, card_type, card_brand, card_currency,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['cardholder_id'] = cardholder_id;
  map['key'] = "createCard";
  map['card_type'] = card_type;
  map['card_brand'] = card_brand;
  map['card_currency'] = card_currency;
log(map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.bridgeCard),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Helpers.hideLoader(loader);
    return ModelCreateCard.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);
    return ModelCreateCard(
        message: jsonDecode(response.body)["message"],
        status: false.toString());
  }
}
