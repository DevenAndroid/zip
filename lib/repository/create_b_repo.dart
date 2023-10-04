import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/create_benificiary.dart';
import '../models/modal_registor.dart';
import '../models/model_update_password.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<CreateBenificiryModel> createBRepo(
    {firstName,
    name,
    accountHolderName,
    destinationAddress,
    required String businessID}) async {
  var map = <String, dynamic>{};
  var map2 = <String, dynamic>{};
  map['firstName'] = firstName;
  map['accountHolderName'] = accountHolderName;
  map2['name'] = name;
  map2['bank'] = map;
  map['type'] = "individual";
  map['currency'] = "GBP";
  map['paymentDestination'] = "bank_account";
  map['destinationAddress'] = destinationAddress;
  print(map);
  // try {
  http.Response response =
      await http.post(Uri.parse(ApiUrls.beneficiariesCreate + businessID),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            "api-key":details.apiKey
          },
          body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return CreateBenificiryModel.fromJson(jsonDecode(response.body));
  } else {
    print(jsonDecode(response.body));
    return CreateBenificiryModel(
        message: jsonDecode(response.body)["message"], success: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
