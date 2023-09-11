import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/create_benificiary.dart';
import '../models/modal_registor.dart';
import '../models/model_conversion.dart';
import '../models/model_create_payout.dart';
import '../models/model_update_password.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelConversion> conversionRepo({transactionType,feeBearer,paymentDestination,context,beneficiaryType,business,sourceCurrency,destinationCurrency,amount,action}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};



  map['amount'] =  amount;
  map['action'] =  action;
  map['transactionType'] =  transactionType;
  map['business'] =  business;
  map['feeBearer'] =  feeBearer;
  map['paymentDestination'] =  paymentDestination;
  map['beneficiaryType'] =  beneficiaryType;
  map['sourceCurrency'] =  sourceCurrency;
  map['destinationCurrency'] =  destinationCurrency;




  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.conversion),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "api-key": "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU"

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    // print(jsonDecode(response.body));
    return ModelConversion.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    // print(jsonDecode(response.body));
    return ModelConversion(message: jsonDecode(response.body)["message"],success: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}