
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/create_virtual_account_model.dart';
import '../models/model_create_vritual_account.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<CreateVirtualAccountModel> accountRepo({email,bvn,phonenumber,context,firstName,accountType,lastName,channel}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map2 = <String, dynamic>{};

  map2['email'] = email;
  map['currency'] = "NGN";
  map2['bvn'] = bvn;
  map2['firstName'] = firstName;
  map['accountType'] = accountType;
  map['channel'] = channel;
  map2['lastName'] = lastName;
  map["KYCInformation"]= map2;


  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.vritualAccountCreate),
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

    return CreateVirtualAccountModel.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    // print(jsonDecode(response.body));
    return CreateVirtualAccountModel(message: jsonDecode(response.body)["message"],success: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
