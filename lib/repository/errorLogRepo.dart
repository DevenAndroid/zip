import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zip/models/errorLogModel.dart';

import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ErrorLogModel> errorLogRepo({responses, context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['response'] = responses;

  log(map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.insertErrorLog),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Helpers.hideLoader(loader);
    return ErrorLogModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);
    return ErrorLogModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
}
