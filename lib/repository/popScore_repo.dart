import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_popscore.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelPopScore> popScoreRepo({popScore, context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['popScore'] = popScore;

  log(map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.insertPopScore),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Helpers.hideLoader(loader);
    return ModelPopScore.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);
    return ModelPopScore(
        message: jsonDecode(response.body)["message"], status: false);
  }
}
