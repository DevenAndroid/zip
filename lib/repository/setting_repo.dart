import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/myprofile_model.dart';
import '../models/setting_modal.dart';
import '../resourses/api_constant.dart';

Future<SettingModal> settingRepo() async {
  var header = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.authorizationHeader:
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTgwYzYwMy1iNTk2LTQyOWItOTkzOS1jNTE3YjdlZWZiY2EiLCJqdGkiOiI2YzdkYzQzNmJlOWI0NWI4Y2RkMWQwMzU0ZjUwYTY1YWU1MTkwNGJlNzYyMjg1YmI2ZWIxZDZmNmJlNTRhOWNmZTEwNzcwYmNlYzhiN2Y0ZSIsImlhdCI6MTY4ODM3MTE1Ny4zMzI4MTUsIm5iZiI6MTY4ODM3MTE1Ny4zMzI4MTksImV4cCI6MTcxOTk5MzU1Ny4zMjkwMjksInN1YiI6IjE0MyIsInNjb3BlcyI6W119.GtQQ89a6Sih_DCctCaElkBGwQR6Oe84beMsNryI1foCPIr24MSYBcASH5s1M-RPNtdS7UihPpPAfIy6aUeg5VVVQXwPm6fnA9KlnYLa_uf77C5a-4dYNTZi1ERsOctWBrrdZxi5FUrGV2JI4XWDebGvd2C5UPFkk0yhiqJvt2orblPzZnm3Z_HftLi6S9kfQTVOoTmkLTO9QQb1n__Fbq_Z3d5pwpicPIepCFbfalJB2bXe1_qbVSXub-xBaLqbICsrH14mEcnoL0CyMShohsQLX0vzNxMnMbbA0JN-67wdbU77_UZp46KbfA3Ky9Bl4WnRYMR-neTuqLsxBl2BqhnhB3Li498ZZU-F_vzZht482zs_gJ5KWcvfs4k-neA9G9ntTMV0hpGb3kHIyL_yH1obj8wwI_6_2SrBoLtDWJl0oTDdKuOR4lMXBAdubKm69jzBlr37z-vetYMFSlWHvmwqMGg8R85yDGkNOWAp39Z_U1g-2TGgK-ILOaNehwSmpjcqkVmpIguchjnOaSxp_-1TK4fx_njyIVvLWu_tsK0R7csIog2vSQkrxQ1tB6IVSl5-zUBlXMRe2ANZMY0r5IgX6m6SR8LXX0aaaRl8QnqPKDWCl0GAzmifB52VHjZvHdPMMonR7B_L3scR8EtZe1vC0wtrm5KGie6gGPHTRCr8',
  };
  try {
    http.Response response = await http.get(
        Uri.parse(ApiUrls.userSetting),
      headers: header, );
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