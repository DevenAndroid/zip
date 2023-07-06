
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_create_vritual_account.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelCreateVritualAccount> accountRepo({email,bvn,phonenumber,context,firstname,lastname,narration}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['email'] = email;
  map['is_permanent'] = "true";
  map['bvn'] = bvn;
  map['phonenumber'] = phonenumber;
  map['firstname'] = firstname;
  map['firstname'] = firstname;
  map['lastname'] = lastname;
  map['narration'] = narration;



  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.vritualAccount),
      headers: await getAuthHeaderApi(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelCreateVritualAccount.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelCreateVritualAccount(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
