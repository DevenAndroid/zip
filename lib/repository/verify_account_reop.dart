
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_create_vritual_account.dart';
import '../models/model_verif_account.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelVerifyVritualAccount> verifyAccountRepo({phone_email,flw_ref,order_ref,account_number,frequency,bank_name,context,}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['phone_email'] = phone_email;
  map['flw_ref'] = flw_ref;
  map['order_ref'] = order_ref;
  map['account_number'] = account_number;
  map['frequency'] = frequency;
  map['bank_name'] = bank_name;



  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.verifyAccount),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelVerifyVritualAccount.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelVerifyVritualAccount(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
