import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/model_cabel_list.dart';
import '../models/model_fetch_telcos.dart';
import '../models/model_get_binificery.dart';
import '../models/modelbenificerylist.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

Future<ModelCabelList> getCableRepo({key, identifier}) async {
  var map = <String, dynamic>{};
  map['key'] = key;
  map['identifier'] = identifier;
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.serviceCommon),
      headers: await getAuthHeader(), body: jsonEncode(map));

  // log("response.body.....    ${response.body}");

  if (response.statusCode == 200) {
    return ModelCabelList.fromJson(jsonDecode(response.body));
  } else {
    return ModelCabelList(
        message: jsonDecode(response.body)["message"],
        data: null,
        status: false);
  }
  // } catch (e) {
  //   return GetBenificiryModel(message: e.toString(),  data: null,success: false);
  // }
}
