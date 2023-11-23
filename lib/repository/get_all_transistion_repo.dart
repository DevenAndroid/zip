

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_all_transistion.dart';
import '../models/model_beneficary_list.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_movement_rates_response.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelAllTransistion> transistionListGetRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.transactionList),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelAllTransistion.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelAllTransistion(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelAllTransistion(message: e.toString(), status: false, data: null);
  }
}


