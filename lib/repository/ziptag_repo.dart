import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/ziptagmodel.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ZipTagModel> zipTagRepo({zip_tag}) async {
  var map = <String, dynamic>{};

  map['zip_tag'] = zip_tag;

  http.Response response = await http.post(Uri.parse(ApiUrls.zipTag),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return ZipTagModel.fromJson(jsonDecode(response.body));
  } else {
    print(jsonDecode(response.body));
    return ZipTagModel(
      message: jsonDecode(response.body)["message"],
    );
  }
}
