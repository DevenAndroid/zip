import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/create_virtual_account_model.dart';
import '../models/model_create_vritual_account.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

final details = Get.put(DetailsController());

Future<CreateVirtualAccountModel> accountRepo(
    {bvn, phonenumber, dateOfBirth, context, firstName, lastName}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map2 = <String, dynamic>{};

  map['currency'] = "NGN";
  map['key'] = "createAcc";
  map['api-key'] = details.apiKey;
  map['accountType'] = "individual";
  map2['bvn'] = bvn;
  map2['firstName'] = firstName;
  map['channel'] = "globus";
  map2['lastName'] = lastName;
  map['dateOfBirth'] = dateOfBirth;
  map["KYCInformation"] = map2;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.common),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: jsonEncode(map));
  log("Sign IN DATA vritual ${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return CreateVirtualAccountModel.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    // print(jsonDecode(response.body));
    return CreateVirtualAccountModel(
        message: jsonDecode(response.body)["message"], success: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
