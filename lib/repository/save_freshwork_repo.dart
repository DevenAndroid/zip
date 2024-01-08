import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_apply_loan.dart';
import '../models/model_update_address.dart';
import '../models/save_card_model.dart';
import '../models/save_freshwork_id_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<SaveFreshworkModel> saveIdRepo({
  freshwork_id,
}) async {
  var map = <String, dynamic>{};

  map['freshwork_id'] = freshwork_id;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.saveFreshwork),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return SaveFreshworkModel.fromJson(jsonDecode(response.body));
  } else {
    print(jsonDecode(response.body));
    return SaveFreshworkModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
