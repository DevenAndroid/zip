import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_choose_bank.dart';
import '../models/model_faq.dart';
import '../models/model_setting.dart';
import '../resourses/api_constant.dart';

Future<ModelFaq> faqRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.faq),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelFaq.fromJson(jsonDecode(response.body));
    } else {
      return ModelFaq();
    }
  } catch (e) {
    return ModelFaq();
  }
}
