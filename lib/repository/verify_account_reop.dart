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


Future<ModelVerifyVritualAccount> verifyAccountRepo(
    {phone_email, accountType, currency, business, business_id, accountInformation, context, accountNumber, KYCInformation}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['phone_email'] = phone_email;
  map['KYCInformation'] = KYCInformation;
  map['accountType'] = accountType;
  map['currency'] = currency;
  map['business'] = business;
  map['accountNumber'] = accountNumber;
  map['business_id'] = business_id;
  map['accountInformation'] = accountInformation;


  print(map);
   try {
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
  }
  else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelVerifyVritualAccount(message: jsonDecode(response.body)["message"],status: false);
  }

}catch (e) {
     throw Exception(e);
return ModelVerifyVritualAccount(message: e.toString(), status: false, data: null);
}
}
