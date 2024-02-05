import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/get_address_model.dart';
import '../models/get_card_balance_model.dart';
import '../models/model_get_card_details.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

final details = Get.put(DetailsController());

Future<GetCardBalanceModel> getCardBalanceRepo({card_id}) async {
  var map = <String, dynamic>{};

  map['key'] = "cardBalance";
  map['card_id'] = card_id;
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.bridgeCard),
        headers: await getAuthHeader(),
        // headers: {
        //   HttpHeaders.contentTypeHeader: 'application/json',
        //   HttpHeaders.acceptHeader: 'application/json',
        //   "token": details.testToken },
        body: jsonEncode(map));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return GetCardBalanceModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return GetCardBalanceModel(
          message: jsonDecode(response.body)["message"],
          status: false.toString(),
          data: null);
    }
  } catch (e) {
    return GetCardBalanceModel(
        message: e.toString(), status: false.toString(), data: null);
  }
}
