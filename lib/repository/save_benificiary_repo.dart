import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_change_zippin.dart';
import '../models/modal_registor.dart';
import '../models/model_save_bank_detilks.dart';
import '../models/save_benificary_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<SaveBenificaryModel> saveBenificaryRepo({destinationAddress,bank_name,account_holder_name, unique_id,firstName}) async {

  var map = <String, dynamic>{};

  map['destination_address'] = destinationAddress;
  map['first_name'] = firstName;
  map['bank_name'] = bank_name;
  map['account_holder_name'] = account_holder_name;
  map['unique_id'] = unique_id;
  map['business_id'] = details.businessID;

  http.Response response = await http.post(Uri.parse(ApiUrls.saveBenificary),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");

  if (response.statusCode == 200) {

    print(jsonDecode(response.body));
    return SaveBenificaryModel.fromJson(jsonDecode(response.body));
  } else {

    print(jsonDecode(response.body));
    return SaveBenificaryModel(
      message: jsonDecode(response.body)["message"],
    );
  }
}
