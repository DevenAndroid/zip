import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_create_vritual_account.dart';
import '../models/model_verif_account.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../models/save_transastion_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';


Future<ModelSaveTransastion> saveTransastionRepo(
    {type, about, amount, description, user_id,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['type'] = type;
  map['user_id'] = user_id;
  map['about'] = about;
  map['amount'] = amount;
  map['description'] = description;



  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.saveTransaction),
        headers: await getAuthHeader(),
        body: jsonEncode(map));
    log("Sign IN DATA${response.body}");
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
    //     headers: await getAuthHeader(),body: jsonEncode(map) );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelSaveTransastion.fromJson(jsonDecode(response.body));
    }
    else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelSaveTransastion(message: jsonDecode(response.body)["message"],status: false);
    }

  }catch (e) {
    throw Exception(e);
    return ModelSaveTransastion(message: e.toString(), status: false,);
  }
}
