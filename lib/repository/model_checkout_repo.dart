import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/modal_registor.dart';
import '../models/model_checkout.dart';
import '../models/model_security_pin.dart';
import '../models/model_update_password.dart';
import '../models/set_transfre_limit_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';


final details = Get.put(DetailsController());
Future<ModelCheckout>   checkoutRepo({context,currency,amount,name,key,phoneNumber,email}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map2 = <String, dynamic>{};



  map['currency'] = currency;
  map['api-key'] =  "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU";
  map['key'] = key;
  // map['paymentMethods'] = "card";
  map['amount'] = amount;
  // map['defaultPaymentMethod'] = "card";
  // map['settlementDestination'] = "settlementDestination";
  map2['name'] = name;
  map2['email'] = email;
  map2['phoneNumber'] = phoneNumber;
  map['customer'] = map2;







  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.common),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',


      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200 || response.statusCode==201) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelCheckout.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelCheckout(message: jsonDecode(response.body)["message"],status: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}