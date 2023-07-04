import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_send_otp_for_pin.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<SendOtpForPinModal> sendOtpForPinRepo({ context, type}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['type'] = type;
  http.Response response = await http.post(Uri.parse(ApiUrls.sendOtpForPin),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  print(map);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return SendOtpForPinModal.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return SendOtpForPinModal(
      message: jsonDecode(response.body)["message"],
    );
  }
}
