import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/buy_cabel_model.dart';
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_buy_interNet.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<BuyCabelTvModel> BuyCabelRepo({  amount,smartcard_number,product_code,month_paid_for,provider,reference,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['amount'] = amount;
  map['smartcard_number'] = smartcard_number;
  map['product_code'] = product_code;
  map['month_paid_for'] = month_paid_for;
  map['provider'] = provider;
  map['reference'] = reference;
  http.Response response = await http.post(Uri.parse(ApiUrls.buyCabeltv),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "secret-key": "Fincra_SECRETUFJPW1QKHYXS5",
        "api-key": "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU",

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return BuyCabelTvModel.fromJson(jsonDecode(response.body),);
  } else {
    Helpers.hideLoader(loader);

    return BuyCabelTvModel(
        message: jsonDecode(response.body)["message"],success: false
    );
  }
}
