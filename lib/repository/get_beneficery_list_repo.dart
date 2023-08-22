

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_beneficary_list.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ListBenificaryModel> benificaryListGetRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getBenificaryList),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ListBenificaryModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ListBenificaryModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ListBenificaryModel(message: e.toString(), status: false, data: null);
  }
}
