import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_change_zippin.dart';
import '../models/modal_registor.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ChangeZipPinModal> changeZipPinRepo({old_zip_pin, context, new_zip_pin}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['old_zip_pin'] = old_zip_pin;
  map['new_zip_pin'] = new_zip_pin;

  http.Response response = await http.post(Uri.parse(ApiUrls.changeZipPin),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ChangeZipPinModal.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ChangeZipPinModal(
      message: jsonDecode(response.body)["message"],
    );
  }
}
