import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_signout.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelSignout> signoutRepo(context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.logout),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelSignout.fromJson(jsonDecode(response.body));
    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelSignout(
        message: jsonDecode(response.body)["message"],
        status: false,
      );
    }
  } catch (e) {
    return ModelSignout(
      message: e.toString(),
      status: false,
    );
  }
}
