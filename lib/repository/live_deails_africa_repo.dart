import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/errorLogModel.dart';
import '../models/model_detail_africa.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';
import 'errorLogRepo.dart';

Rx<ErrorLogModel> error = ErrorLogModel().obs;
Rx<RxStatus> statusOfError = RxStatus.empty().obs;
Future<ModelLiveDetails> africaLiveDetailsRepo({
  searchParameter,
  verificationType,
  context,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['searchParameter'] = searchParameter;
  map['verificationType'] = verificationType;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.liveDetailsAfrica),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "apiKey": "F7pOOIfvwn0ancEWB8XC",
        "userid": "1684246314513"
      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    errorLogRepo(
            responses: response.body,
            context: context,
            type: "BVN-FULL-DETAILS")
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelLiveDetails.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelLiveDetails();
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
