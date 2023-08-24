import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_data_paln.dart';
import '../models/model_veryfy_meter.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelVerifyMeterNumber> verifyMeterRepo({  provider,meter_number}) async {

  var map = <String, dynamic>{};
  map['provider'] = provider;
  map['meter_number'] = meter_number;
  http.Response response = await http.post(Uri.parse(ApiUrls.verifyMeter),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "secret-key": "Fincra_SECRETUFJPW1QKHYXS5"

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  print(map);

  if (response.statusCode == 200) {


    return ModelVerifyMeterNumber.fromJson(jsonDecode(response.body),);
  } else {


    return ModelVerifyMeterNumber(
        message: jsonDecode(response.body)["message"],success: false
    );
  }
}
