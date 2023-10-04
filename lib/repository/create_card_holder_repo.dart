import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/buy_cabel_model.dart';
import '../models/buy_plan_model.dart';
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_buy_interNet.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_create_card_holder.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelCreateCardHolder> cardHolderRepo({ first_name , last_name,address,city, state,country,postal_code,house_no,phone,email_address,id_type, bvn,selfie_image,context,
}) async {


  var map = <String, dynamic>{};
  var map1 = <String, dynamic>{};
  var map2 = <String, dynamic>{};
  map['first_name'] = first_name;
  map['last_name'] =  last_name;
  map['phone'] =         phone;
  map['email_address'] = email_address;
  map['address'] = map1;
  map['identity'] = map2;
  map1['address'] =     address;
  map1['city'] =        city;
  map1['state'] =       state;
  map1['country'] =     country;
  map1['postal_code'] = postal_code;
  map1['house_no'] =    house_no;
  map2['id_type'] =    id_type;
  map2['bvn'] =    bvn;
  map2['selfie_image'] =    selfie_image;
  http.Response response = await http.post(Uri.parse(ApiUrls.createCardHolder),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "token": details.testToken

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode==201) {

    return ModelCreateCardHolder.fromJson(jsonDecode(response.body),);
  } else {


    return ModelCreateCardHolder(

        message: jsonDecode(response.body)["message"],status: false.toString()
    );
  }
}
