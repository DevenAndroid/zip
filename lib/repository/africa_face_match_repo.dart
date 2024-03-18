import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/errorLogModel.dart';
import '../models/model_face_match.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';
import 'errorLogRepo.dart';

Rx<ErrorLogModel> error = ErrorLogModel().obs;
Rx<RxStatus> statusOfError = RxStatus.empty().obs;
Future<ModelAfricaFaceMatch> africaFaceRepo({
  selfie,
  verificationType,
  targetImage,
  context,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['verificationType'] = verificationType;
  map['selfie'] = selfie;
  map['targetImage'] = targetImage;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.faceMatchAfrica),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "apiKey": "t9jU0S5L7hRcj7KEfG20",
        "userid": "1684246314513"
      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    errorLogRepo(
            type: "FACEMATCH-VERIFICATION",
            responses: response.body,
            context: context)
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    return ModelAfricaFaceMatch.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    errorLogRepo(
            type: "FACEMATCH-VERIFICATION",
            responses: response.body,
            context: context)
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    print(jsonDecode(response.body));
    return ModelAfricaFaceMatch();
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
