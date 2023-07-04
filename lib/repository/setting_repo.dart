
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_choose_bank.dart';
import '../models/model_setting.dart';
import '../resourses/api_constant.dart';



Future<ModelSetting> settingRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.SettingApi),

    );
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelSetting.fromJson(jsonDecode(response.body));

    } else {

      return ModelSetting(
          message: jsonDecode(response.body)["message"],

          data: null);
    }
  } catch (e) {
    return ModelSetting(message: e.toString(), data: null);
  }
}
