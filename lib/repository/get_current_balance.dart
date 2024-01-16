import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/current_balance_model.dart';
import '../models/model_beneficary_list.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<CurrentBalanceModel> getCurrentBalanceRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.currentBalance),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return CurrentBalanceModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return CurrentBalanceModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return CurrentBalanceModel(
        message: e.toString(), status: false, data: null);
  }
}
