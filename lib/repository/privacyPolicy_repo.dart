import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/PrivicyPolicyModel.dart';
import '../models/get_address_model.dart';
import '../models/model_freeze_card.dart';
import '../models/model_get_card_details.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_unfrrze_card.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

Future<PrivacyPolicyModel> privacyPolicyRepo({slug}) async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.privicyPolicy + slug),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return PrivacyPolicyModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return PrivacyPolicyModel(
          message: jsonDecode(response.body)["message"],
          status:false,
          data: null);
    }
  } catch (e) {
    return PrivacyPolicyModel(
        message: e.toString(), status: false, data: null);
  }
}
