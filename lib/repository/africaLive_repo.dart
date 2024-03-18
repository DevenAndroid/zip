import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/errorLogModel.dart';
import '../models/modelAfricaLive.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';
import 'errorLogRepo.dart';

Rx<ErrorLogModel> error = ErrorLogModel().obs;
Rx<RxStatus> statusOfError = RxStatus.empty().obs;
Future<ModelAfricaLive> africaLiveRepo({
  selfie,
  verificationType,
  context,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['verificationType'] = verificationType;
  map['selfie'] = selfie;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.liveAfrica),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "apiKey": "9BbEYuLV5NRaoEHMuWJY",
        "userid": "1684246314513"
      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    errorLogRepo(
            responses: response.body,
            context: context,
            type: "PASSIVE-LIVELINESS-VERIFICATION")
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    print(jsonDecode(response.body));
    return ModelAfricaLive.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    errorLogRepo(
            responses: response.body,
            context: context,
            type: "PASSIVE-LIVELINESS-VERIFICATION")
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    print(jsonDecode(response.body));
    return ModelAfricaLive();
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
