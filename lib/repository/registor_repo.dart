import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/errorLogModel.dart';
import '../models/modal_registor.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';
import 'errorLogRepo.dart';

Rx<ErrorLogModel> error = ErrorLogModel().obs;
Rx<RxStatus> statusOfError = RxStatus.empty().obs;
Future<RegisterModel> registerRepo(
    {password_confirmation, phone, context, bvn, email, password}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['phone'] = phone;

  map['bvn'] = bvn;

  map['email'] = email;
  map['password_confirmation'] = password_confirmation;
  map['password'] = password;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.registerUser),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    errorLogRepo(
            responses: response.body, context: context, type: "registration")
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    print(jsonDecode(response.body));
    return RegisterModel.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return RegisterModel(
      message: jsonDecode(response.body)["message"],
    );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
