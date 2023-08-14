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
import '../models/model_create_card_holder.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

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
        "token": "Bearer at_test_a1f95e5af450d1d490e4b3a80ee50d44a0c058632a514fabf123cd211f1daf7e7bd09da169ee060746b95de5484018707c83f3327e5d4131eef112969af2fa1a2d1e9f9f932dbbb8ceef7e6ca3af1a0af1157188f3c2d05d68623bfed1e085fe907237d85d403d41c97334667cf3d656e7e4bc874565dafe466f4d1f109bb2dbaca43b1eb1de8cc38849c0d96d936d66602cb24474bd43a9ff4db139b82faadd6523d5137f72b5dc0637225b665016c436e8b4a3b0548aade184bd2cc2ef19990c4965c13ef7cdb0058202aa1ee85aa87faec1776853b5c0c880d911425fe075ef5c35be6e683ea58c186f48278ae430c038432092b4c12f7755c52aad7b81b1",


      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {

    return ModelCreateCardHolder.fromJson(jsonDecode(response.body),);
  } else {


    return ModelCreateCardHolder(

        message: jsonDecode(response.body)["message"],status: false.toString()
    );
  }
}
