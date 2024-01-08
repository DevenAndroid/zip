import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/update_setting_modal.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<UpdateSettingModal> updateSettingRepo(
    {hide_balance,
    context,
    enable_security_lock,
    transaction_pin,
    enable_fingerprints}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['hide_balance'] = hide_balance;
  map['enable_security_lock'] = enable_security_lock;
  map['transaction_pin'] = transaction_pin;
  map['enable_fingerprints'] = enable_fingerprints;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.updateSetting),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return UpdateSettingModal.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return UpdateSettingModal(
      message: jsonDecode(response.body)["message"],
    );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
