import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/model_create_contact.dart';
import '../models/update_contact_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelUpdateContact> updateContactRepo({ mobile_number,cf_customer_id,context,cf_product_type,id}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  // var map = <String, dynamic>{};
  // var map1 = <String, dynamic>{};
  // var map2 = <String, dynamic>{};
  // map['contact'] = map1;
  // map1['mobile_number'] = mobile_number;
  // map1['custom_field'] = map2;
  // map2['cf_product_type'] = cf_product_type;

  http.Response response = await http.put(Uri.parse("https://zipinternationallimited-team.myfreshworks.com/crm/sales/api/contacts/$id"),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "Authorization": details.Authorization,


      },
      body: jsonEncode({
        "contact": {
          "mobile_number": mobile_number,
          "custom_field": {
            "cf_product_type": cf_product_type
          }
        }
      }));
  log("Sign IN DATA   ${response.body}");
  log("Sign IN DATA   ${"https://zipinternationallimited-team.myfreshworks.com/crm/sales/api/contacts/$id"}");
  log("Sign IN DATA   ${response.statusCode}");
  print({
    "contact": {
      "mobile_number": mobile_number,
      "custom_field": {
        "cf_product_type": cf_product_type
      }
    }
  });

  if (response.statusCode == 200 || response.statusCode == 201) {

    Helpers.hideLoader(loader);
    return ModelUpdateContact.fromJson(jsonDecode(response.body),);
  } else {

    Helpers.hideLoader(loader);
    throw Exception(response.body);
    // return ModelCreateContact()

  }
}
