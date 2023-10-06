

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/get_address_model.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<GetAddressModel> getAddressRepo() async {
  try {
    http.Response response = await http.get(Uri.parse(ApiUrls.myAddress),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return GetAddressModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return GetAddressModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return GetAddressModel(message: e.toString(), status: false, data: null);
  }
}
