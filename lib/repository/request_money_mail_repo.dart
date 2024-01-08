import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_apply_loan.dart';
import '../models/model_update_address.dart';
import '../models/request_money_mail_model.dart';
import '../models/save_card_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<RequestMoneyMail> requestMailRepo(
    {requested_id,
    type,
    amount,
    phone,
    email,
    by_requested_id,
    generate_link}) async {
  var map = <String, dynamic>{};

  map['requested_id'] = requested_id;
  map['type'] = type;
  map['amount'] = amount;
  map['phone'] = phone;
  map['email'] = email;
  map['by_requested_id'] = by_requested_id;
  map['generate_link'] = generate_link;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.seveRequestMail),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return RequestMoneyMail.fromJson(jsonDecode(response.body));
  } else {
    print(jsonDecode(response.body));
    return RequestMoneyMail(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
