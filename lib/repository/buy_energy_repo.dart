import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/buy_energy_model.dart';
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelBuyEnergy> BuyEnergyPlanRepo({  amount,phone_no,provider,meter_number,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['amount'] = amount;
  map['phone_no'] = phone_no;
  map['provider'] = provider;
  map['meter_number'] = meter_number;
  http.Response response = await http.post(Uri.parse(ApiUrls.purchaseEnergy),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "secret-key": "Fincra_SECRETUFJPW1QKHYXS5"

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {

    Helpers.hideLoader(loader);
    return ModelBuyEnergy.fromJson(jsonDecode(response.body),);
  } else {
    Helpers.hideLoader(loader);

    return ModelBuyEnergy(
        message: jsonDecode(response.body)["message"],success: false
    );
  }
}