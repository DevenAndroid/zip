import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/errorLogModel.dart';
import '../models/model_create_card_holder.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
import 'errorLogRepo.dart';

final details = Get.put(DetailsController());
Rx<ErrorLogModel> error = ErrorLogModel().obs;
Rx<RxStatus> statusOfError = RxStatus.empty().obs;
Future<ModelCreateCardHolder> cardHolderRepo({
  first_name,
  selfie_image,
  card_brand,
  card_type,
  card_currency,
  user_id,
  last_name,
  address,
  city,
  state,
  country,
  postal_code,
  house_no,
  phone,
  email_address,
  id_type,
  context,
  bvn,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map1 = <String, dynamic>{};
  var map2 = <String, dynamic>{};
  var map3 = <String, dynamic>{};
  map['first_name'] = first_name;
  map['key'] = "registerCardHolder";
  map['last_name'] = last_name;
  map['phone'] = phone;
  map['email_address'] = email_address;
  map['address'] = map1;
  map['meta_data'] = map3;
  map['identity'] = map2;
  map1['address'] = address;
  map1['city'] = city;
  map1['state'] = state;
  map1['country'] = country;
  map1['postal_code'] = postal_code;
  map1['house_no'] = house_no;
  map2['id_type'] = id_type;
  map2['bvn'] = bvn;
  map2['selfie_image'] = selfie_image;
  map3['user_id'] = user_id;
  map3['card_currency'] = card_currency;
  map3['card_type'] = card_type;
  map3['card_brand'] = card_brand;
  http.Response response = await http.post(Uri.parse(ApiUrls.bridgeCard),
      headers: await getAuthHeader(), body: jsonEncode(map));

  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  log("Sign IN DATA $map");
  if (kDebugMode) {
    print(map);
  }

  if (response.statusCode == 200 || response.statusCode == 201) {
    Helpers.hideLoader(loader);
    errorLogRepo(
            responses: response.body, context: context, type: "card holder")
        .then((value) {
      error.value = value;
      if (value.status == true) {
        statusOfError.value = RxStatus.success();
      } else {
        statusOfError.value = RxStatus.error();
      }
    });
    return ModelCreateCardHolder.fromJson(
      jsonDecode(response.body),
    );
  } else {
    return ModelCreateCardHolder(
        message: jsonDecode(response.body)["message"],
        status: false.toString());
  }
}
