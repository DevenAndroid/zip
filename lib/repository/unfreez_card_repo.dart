import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/get_address_model.dart';
import '../models/model_freeze_card.dart';
import '../models/model_get_card_details.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_unfrrze_card.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelUnfreezCard> UnFreezeCardRepo({card_id}) async {
  var map = <String, dynamic>{};

  map['key'] = "unfreezeCard";
  map['card_id'] = card_id;
  try {
    http.Response response = await http.post(
      Uri.parse(ApiUrls.bridgeCard),
        headers: await getAuthHeader(),
      // headers: {
      //   HttpHeaders.contentTypeHeader: 'application/json',
      //   HttpHeaders.acceptHeader: 'application/json',
      //   "token": details.testToken
      // },
        body: jsonEncode(map)
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelUnfreezCard.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelUnfreezCard(
          message: jsonDecode(response.body)["message"],
          status: false.toString(),
          data: null);
    }
  } catch (e) {
    return ModelUnfreezCard(
        message: e.toString(), status: false.toString(), data: null);
  }
}
