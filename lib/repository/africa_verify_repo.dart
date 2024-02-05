import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/africa_verify_model.dart';
import '../models/modal_registor.dart';
import '../models/verify_africa.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelAfricaVerify> verificationAfricaRepo({
  verificationStatus,
  context,
  user_id,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['verificationStatus'] = verificationStatus;
  map['user_id'] = user_id;

  // try {
  http.Response response = await http.post(
      Uri.parse(ApiUrls.verificationAfrica),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );
  print(response.body);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return ModelAfricaVerify.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);

    return ModelAfricaVerify(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
