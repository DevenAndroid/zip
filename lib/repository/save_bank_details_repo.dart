import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_change_zippin.dart';
import '../models/modal_registor.dart';
import '../models/model_save_bank_detilks.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelSaveBankDetails> saveBankRepo({destinationAddress, context,bank_name, firstName}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['destinationAddress'] = destinationAddress;
  map['firstName'] = firstName;
  map['bank_name'] = bank_name;

  http.Response response = await http.post(Uri.parse(ApiUrls.saveBankDetails),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSaveBankDetails.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSaveBankDetails(
      message: jsonDecode(response.body)["message"],
    );
  }
}
