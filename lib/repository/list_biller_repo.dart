
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/mode_biller.dart';
import '../models/model_cabel_list.dart';
import '../models/model_fetch_telcos.dart';
import '../models/model_get_binificery.dart';
import '../models/modelbenificerylist.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelBiller> getBillerRepo() async {

  // try {
  http.Response response = await http.get(
    Uri.parse(ApiUrls.biller),
    headers: { HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      "secret-key": "Fincra_SECRETUFJPW1QKHYXS5"

    },
  );

  log("response.body.....    ${response.body}");
  log("response.body.....    ${response.statusCode}");

  if (response.statusCode == 200) {
    return ModelBiller.fromJson(jsonDecode(response.body));
  } else {
    return ModelBiller(message: jsonDecode(response.body)["message"],

        data: null,success: false);
  }
  // } catch (e) {
  //   return GetBenificiryModel(message: e.toString(),  data: null,success: false);
  // }
}
