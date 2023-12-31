import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_apply_loan.dart';
import '../models/model_update_address.dart';
import '../models/save_card_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelSaveCard> saveCardRepo({card_id,card_name,card_holder_id,brand,card_currency,last_4,cvv,expiry_year,expiry_month,card_number}) async {

  var map = <String, dynamic>{};

  map['card_id'] = card_id;
  map['card_name'] =  card_name;
  map['brand'] = brand;
  map['card_currency'] = card_currency;
  map['last_4'] = last_4;
  map['cvv'] = cvv;
  map['expiry_year'] = expiry_year;
  map['expiry_month'] = expiry_month;
  map['card_number'] = card_number;
  map['card_holder_id'] = card_holder_id;



  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.saveCardInfo),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {

    print(jsonDecode(response.body));
    return ModelSaveCard.fromJson(jsonDecode(response.body));

  } else {

    print(jsonDecode(response.body));
    return ModelSaveCard(message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}