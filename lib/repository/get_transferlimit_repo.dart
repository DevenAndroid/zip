

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelGetTransfreLimit> transferLimitGetRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.transfreLimitGet),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelGetTransfreLimit.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelGetTransfreLimit(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelGetTransfreLimit(message: e.toString(), status: false, data: null);
  }
}
