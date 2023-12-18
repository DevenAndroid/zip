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
      bank_code,
      unique_id,
    accountHolderName,
    destinationAddress,
    required String businessID}) async {
  var map = <String, dynamic>{};
  var map2 = <String, dynamic>{};
  map['first_name'] = firstName;
  map['business_id'] = businessID;
  map['unique_id'] = unique_id;
  map['bank_name'] = name;
  map['bank_code'] = bank_code;
  // map['key'] = "beneficiaryCreate";
  // map['api-key'] =   details.apiKey;
  map['account_holder_name'] = accountHolderName;

  // map2['bank'] = map;
  // map['type'] = "individual";
  map['currency'] = "NGN";
  map['paymentDestination'] = "bank_account";
  map['destination_address'] = destinationAddress;
  print(map);
  // try {
  http.Response response =
      await http.post(Uri.parse(ApiUrls.saveBenificary),
          headers:await getAuthHeader(),
          body: jsonEncode(map));
  log("Sign IN DATAAAAAA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return CreateBenificiryModel.fromJson(jsonDecode(response.body));
  } else {
    print(jsonDecode(response.body));
    return CreateBenificiryModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
