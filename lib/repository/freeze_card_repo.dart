import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/get_address_model.dart';
import '../models/model_freeze_card.dart';
import '../models/model_get_card_details.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelFreezeCard> freezeCardRepo({card_id}) async {
  try {
    http.Response response = await http.patch(
      Uri.parse(ApiUrls.freezeCard + card_id),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "token":
        "Bearer at_test_a1f95e5af450d1d490e4b3a80ee50d44a0c058632a514fabf123cd211f1daf7e7bd09da169ee060746b95de5484018707c83f3327e5d4131eef112969af2fa1a2d1e9f9f932dbbb8ceef7e6ca3af1a0af1157188f3c2d05d68623bfed1e085fe907237d85d403d41c97334667cf3d656e7e4bc874565dafe466f4d1f109bb2dbaca43b1eb1de8cc38849c0d96d936d66602cb24474bd43a9ff4db139b82faadd6523d5137f72b5dc0637225b665016c436e8b4a3b0548aade184bd2cc2ef19990c4965c13ef7cdb0058202aa1ee85aa87faec1776853b5c0c880d911425fe075ef5c35be6e683ea58c186f48278ae430c038432092b4c12f7755c52aad7b81b1",
      },
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelFreezeCard.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelFreezeCard(
          message: jsonDecode(response.body)["message"],
          status: false.toString(),
          data: null);
    }
  } catch (e) {
    return ModelFreezeCard(
        message: e.toString(), status: false.toString(), data: null);
  }
}
