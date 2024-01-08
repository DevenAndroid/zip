import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/Forgot_email_model.dart';
import '../models/africa_verify_model.dart';
import '../models/forgot_pass_model.dart';
import '../models/modal_registor.dart';
import '../models/verify_africa.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ForgotPassModel> forgotPassRepo(
    {context, password, confirm_password, email}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['password'] = password;
  map['email'] = email;
  map['confirm_password'] = confirm_password;

  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.resetPassword),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );
  print(response.body);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return ForgotPassModel.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);

    return ForgotPassModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
