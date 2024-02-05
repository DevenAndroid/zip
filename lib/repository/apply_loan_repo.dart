import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_apply_loan.dart';
import '../models/model_update_address.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelApplyLoan> loanRepo(
    {loan_purpose,
    context,
    residential_status,
    employed_status,
    monthly_income,
    duration_of_loan,
    desired_amount,
    increament}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['loan_purpose'] = loan_purpose;
  map['residential_status'] = residential_status;
  map['employed_status'] = employed_status;
  map['monthly_income'] = monthly_income;
  map['duration_of_loan'] = duration_of_loan;
  map['desired_amount'] = desired_amount;
  map['increament'] = increament;

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.applyLoan),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelApplyLoan.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelApplyLoan(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
