import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/Forgot_email_model.dart';
import '../models/africa_verify_model.dart';
import '../models/modal_registor.dart';
import '../models/verify_africa.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ForgotEmailModel> forgotEmailRepo({context,email}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['email'] = email;







  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.forgotEmail),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );
  print(response.body);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return ForgotEmailModel.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);

    return ForgotEmailModel(message: jsonDecode(response.body)["message"],status: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}