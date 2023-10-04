import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/get_address_model.dart';
import '../models/model_get_card_details.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelGetCardDetails> getCardDetailsRepo({card_id}) async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getCardDetails + card_id),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "token":details.testToken},
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelGetCardDetails.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelGetCardDetails(
          message: jsonDecode(response.body)["message"],
          status: false.toString(),
          data: null);
    }
  } catch (e) {
    return ModelGetCardDetails(
        message: e.toString(), status: false.toString(), data: null);
  }
}
