import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_registor.dart';
import '../models/model_update_password.dart';
import '../models/set_transfre_limit_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelSetTransfreLimit> setTransferRepo({
  context,
  tranfer_limit,
  pin,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['tranfer_limit'] = tranfer_limit;
  map['pin'] = pin;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.transfreLimitPost),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSetTransfreLimit.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSetTransfreLimit(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
