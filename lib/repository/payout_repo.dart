import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/create_benificiary.dart';
import '../models/modal_registor.dart';
import '../models/model_create_payout.dart';
import '../models/model_update_password.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

final details = Get.put(DetailsController());

Future<ModelPayout> payoutRepo(
    {firstName,
    accountHolderName,
    about,
    bank_code,
    accountNumber,
    user_id,
    key,
    context,
    type,
    customerReference,
    business,
    paymentDestination,
    sourceCurrency,
    destinationCurrency,
    amount,
    description}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map1 = <String, dynamic>{};

  map1['firstName'] = firstName;
  map1['about'] = about;

  map1['accountHolderName'] = accountHolderName;
  map1['accountNumber'] = accountNumber;
  map['description'] = description;
  map['user_id'] = user_id;
  map['business'] = business;
  map['beneficiary'] = map1;
  map1['type'] = type;
  map1['bank_code'] = bank_code;
  map["customerReference"] = customerReference;
  map["key"] = key;
  map['api-key'] = details.apiKey;
  // map1['email'] =  email;

  map['paymentDestination'] = paymentDestination;
  map['sourceCurrency'] = sourceCurrency;
  map['destinationCurrency'] = destinationCurrency;
  // map1['lastName'] =  lastName;
  map['amount'] = amount;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.common),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${getAuthHeader()}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return ModelPayout.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);

    return ModelPayout(
        message: jsonDecode(response.body)["message"], success: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
