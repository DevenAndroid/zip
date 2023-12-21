import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_data_paln.dart';
import '../models/model_veryfy_meter.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelVerifyMeterNumber> verifyMeterRepo({key,type,billersCode,serviceID}) async {

  var map = <String, dynamic>{};
  map['key'] = key;
  map['type'] = type;
  map['billersCode'] = billersCode;
  map['serviceID'] = serviceID;
  http.Response response = await http.post(Uri.parse(ApiUrls.serviceCommon),
      headers:await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  print(map);

  if (response.statusCode == 200) {


    return ModelVerifyMeterNumber.fromJson(jsonDecode(response.body),);
  } else {


    return ModelVerifyMeterNumber(
        message: jsonDecode(response.body)["message"],status: false
    );
  }
}
