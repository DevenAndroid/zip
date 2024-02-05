import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/model_create_contact.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

final details = Get.put(DetailsController());

Future<ModelCreateContact> createContactRepo(
    {first_name,
    last_name,
    mobile_number,
    emails,
    cf_customer_id,
    last_source,
    context,
    cf_product_type}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map1 = <String, dynamic>{};
  var map2 = <String, dynamic>{};
  map['contact'] = map1;
  map1['first_name'] = first_name;
  map1['last_name'] = last_name;
  map1['mobile_number'] = mobile_number;
  map1['emails'] = emails;
  map1['custom_field'] = map2;
  map2['cf_product_type'] = cf_product_type;
  map2['cf_customer_id'] = cf_customer_id;
  map2['last_source'] = last_source;

  http.Response response = await http.post(Uri.parse(ApiUrls.createContact),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "Authorization": details.Authorization,
      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return ModelCreateContact.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);
    return ModelCreateContact.fromJson(
      jsonDecode(response.body),
    );
    // return ModelCreateContact()
  }
}
