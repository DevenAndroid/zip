import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/create_benificiary.dart';
import '../models/modal_registor.dart';
import '../models/model_account_resolve.dart';
import '../models/model_conversion.dart';
import '../models/model_create_payout.dart';
import '../models/model_update_password.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelAccountResolve> resolveRepo({accountNumber,bankCode,context,}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};



  map['accountNumber'] =  accountNumber;
  map['bankCode'] =  bankCode;
  map['type'] =  "nuban";





  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.resolve),
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
    print(jsonDecode(response.body));
    return ModelAccountResolve.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelAccountResolve(message: jsonDecode(response.body)["message"],success: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}