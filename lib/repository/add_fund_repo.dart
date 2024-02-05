import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/create_benificiary.dart';
import '../models/modal_registor.dart';
import '../models/model_fund_card.dart';
import '../models/model_update_password.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

final details = Get.put(DetailsController());

Future<ModelFundCard> addFundRepo(
    {card_id, amount, transaction_reference, currency, context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);

  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['card_id'] = card_id;
  map['amount'] = amount;
  map['transaction_reference'] = transaction_reference;
  map['currency'] = currency;
  map['key'] = "fundCard";
  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.bridgeCard),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelFundCard.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelFundCard(
        message: jsonDecode(response.body)["message"],
        status: false.toString());
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
