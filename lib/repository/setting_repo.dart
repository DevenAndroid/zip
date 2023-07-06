

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/myprofile_model.dart';
import '../models/setting_modal.dart';
import '../resourses/api_constant.dart';

Future<SettingModal> settingRepo() async {

  try {
    http.Response response = await http.get(
        Uri.parse(ApiUrls.userSetting),
        headers: await getAuthHeader());

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return SettingModal.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return SettingModal(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return SettingModal(message: e.toString(), status: false, data: null);
  }
}

//
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       return SettingModal.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception(response.body);
//     }
//   } catch (e) {
//     throw Exception(e);
//   }
// }

