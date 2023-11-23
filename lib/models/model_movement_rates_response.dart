import 'dart:developer';

class ModelMovementsRateResponse {
  Map<DateTime, List<MovementInfo>>? response;
  List<MovementInfo>? movementInfo;
  ModelMovementsRateResponse({this.response});
  ModelMovementsRateResponse.fromJson(Map<String, dynamic> map) {
    // log("map.....       ${map}");
    if (map["response"] != null) {
      Map responseMap = map["response"] as Map;
      for (var element in responseMap.entries) {
        List<MovementInfo> temp = [];
        element.value.forEach((e) {
          temp.add(MovementInfo.fromJson(e));
        });
        // log("kk.....      ${temp}");

        // log("kk.....      ${element.key}");
        // log("kk.....      ${DateTime.parse(element.key)}");
        response ??= {};
        response![DateTime.parse(element.key)] = temp;
      }

      List<int> items =
          response!.entries.map((e) => e.key.millisecondsSinceEpoch).toList();
      // log("kk.....      ${items}");
      // log("kk.....      ${items.reduce((curr, next) => curr > next? curr: next)}");

      List<MovementInfo>? kk = response![DateTime.fromMillisecondsSinceEpoch(
          items.reduce((curr, next) => curr > next ? curr : next))];
      if (kk != null) {
        movementInfo = kk;
      }
    }
    // response = {};
  }
}

class MovementInfo {
  String? currency_name;
  String? currency_rate;
  MovementInfo({this.currency_name, this.currency_rate});
  MovementInfo.fromJson(Map<String, dynamic> map) {
    currency_name = map["currency_name"];
    currency_rate = map["currency_rate"];
  }
}

const String apiResponse = '''{
    "response": {
"2023-11-22 18:21:15": [
{
"id": 79003,
"currency_name": "EUR",
"currency_rate": "1235 / 1245***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-22T18:21:15.000Z",
"updated_at": "2023-11-22T18:21:45.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-22T18:21:15.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 79002,
"currency_name": "GBP",
"currency_rate": "1425 / 1435***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-22T18:21:15.000Z",
"updated_at": "2023-11-22T18:21:43.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-22T18:21:15.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 79001,
"currency_name": "USD",
"currency_rate": "1150 / 1160***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-22T18:21:15.000Z",
"updated_at": "2023-11-22T18:21:42.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-22T18:21:15.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-22 12:04:57": [
{
"id": 78992,
"currency_name": "EUR",
"currency_rate": "1235 / 1245**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-22T12:04:57.000Z",
"updated_at": "2023-11-22T12:48:01.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-22T12:04:57.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78991,
"currency_name": "GBP",
"currency_rate": "1425 / 1435**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-22T12:04:57.000Z",
"updated_at": "2023-11-22T12:48:00.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-22T12:04:57.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78990,
"currency_name": "USD",
"currency_rate": "1150 / 1160**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-22T12:04:57.000Z",
"updated_at": "2023-11-22T12:08:26.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-22T12:04:57.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-22 08:57:27": [
{
"id": 78989,
"currency_name": "EUR",
"currency_rate": "1210 / 1220*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-22T08:57:27.000Z",
"updated_at": "2023-11-22T08:58:51.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-22T08:57:27.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78988,
"currency_name": "GBP",
"currency_rate": "1410 / 1420*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-22T08:57:27.000Z",
"updated_at": "2023-11-22T08:58:51.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-22T08:57:27.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78987,
"currency_name": "USD",
"currency_rate": "1135 / 1145*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-22T08:57:27.000Z",
"updated_at": "2023-11-22T08:58:51.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-22T08:57:27.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-21 18:05:01": [
{
"id": 78947,
"currency_name": "EUR",
"currency_rate": "1210 / 1220***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-21T18:05:01.000Z",
"updated_at": "2023-11-21T18:37:05.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T18:05:01.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78946,
"currency_name": "GBP",
"currency_rate": "1410 / 1420***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-21T18:05:01.000Z",
"updated_at": "2023-11-21T18:37:05.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T18:05:01.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78945,
"currency_name": "USD",
"currency_rate": "1135 / 1145***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-21T18:05:01.000Z",
"updated_at": "2023-11-21T18:37:05.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T18:05:01.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-21 11:23:54": [
{
"id": 78944,
"currency_name": "EUR",
"currency_rate": "1200 / 1210**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-21T11:23:54.000Z",
"updated_at": "2023-11-21T11:55:45.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T11:23:54.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78943,
"currency_name": "GBP",
"currency_rate": "1400 / 1410**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-21T11:23:54.000Z",
"updated_at": "2023-11-21T11:55:45.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T11:23:54.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78942,
"currency_name": "USD",
"currency_rate": "1135 / 1145**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-21T11:23:54.000Z",
"updated_at": "2023-11-21T11:55:45.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T11:23:54.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-21 08:51:11": [
{
"id": 78941,
"currency_name": "EUR",
"currency_rate": "1200 / 1210*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-21T08:51:11.000Z",
"updated_at": "2023-11-21T08:52:35.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T08:51:11.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78940,
"currency_name": "GBP",
"currency_rate": "1390 / 1410*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-21T08:51:11.000Z",
"updated_at": "2023-11-21T08:52:35.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T08:51:11.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78939,
"currency_name": "USD",
"currency_rate": "1130 / 1140*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-21T08:51:11.000Z",
"updated_at": "2023-11-21T08:52:35.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-21T08:51:11.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-20 17:58:18": [
{
"id": 78907,
"currency_name": "EUR",
"currency_rate": "1200 / 1210***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-20T17:58:18.000Z",
"updated_at": "2023-11-20T17:58:40.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-20T17:58:18.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78906,
"currency_name": "GBP",
"currency_rate": "1390 / 1410***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-20T17:58:18.000Z",
"updated_at": "2023-11-20T17:58:39.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-20T17:58:18.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78905,
"currency_name": "USD",
"currency_rate": "1130 / 1140***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-20T17:58:18.000Z",
"updated_at": "2023-11-20T17:58:38.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-20T17:58:18.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-20 11:29:59": [
{
"id": 78893,
"currency_name": "EUR",
"currency_rate": "1200 / 1210**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-20T11:29:59.000Z",
"updated_at": "2023-11-20T11:31:26.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-20T11:29:59.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78892,
"currency_name": "GBP",
"currency_rate": "1390 / 1410**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-20T11:29:59.000Z",
"updated_at": "2023-11-20T11:31:24.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-20T11:29:59.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78891,
"currency_name": "USD",
"currency_rate": "1130 / 1140**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-20T11:29:59.000Z",
"updated_at": "2023-11-20T11:31:23.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-20T11:29:59.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-20 08:33:12": [
{
"id": 78890,
"currency_name": "EUR",
"currency_rate": "1190 / 1200*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-20T08:33:12.000Z",
"updated_at": "2023-11-20T08:34:35.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-20T08:33:12.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78889,
"currency_name": "GBP",
"currency_rate": "1380 / 1390*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-20T08:33:12.000Z",
"updated_at": "2023-11-20T08:34:35.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-20T08:33:12.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78888,
"currency_name": "USD",
"currency_rate": "1125 / 1135*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-20T08:33:12.000Z",
"updated_at": "2023-11-20T08:34:35.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-20T08:33:12.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-17 18:09:44": [
{
"id": 78803,
"currency_name": "EUR",
"currency_rate": "1190 / 1200***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-17T18:09:44.000Z",
"updated_at": "2023-11-17T18:10:08.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-17T18:09:44.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78802,
"currency_name": "GBP",
"currency_rate": "1380 / 1390***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-17T18:09:44.000Z",
"updated_at": "2023-11-17T18:10:07.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-17T18:09:44.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78801,
"currency_name": "USD",
"currency_rate": "1125 / 1135***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-17T18:09:44.000Z",
"updated_at": "2023-11-17T18:10:06.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-17T18:09:44.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-17 11:50:32": [
{
"id": 78789,
"currency_name": "EUR",
"currency_rate": "1190 / 1200**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-17T11:50:32.000Z",
"updated_at": "2023-11-17T11:50:44.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-17T11:50:32.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78788,
"currency_name": "GBP",
"currency_rate": "1380 / 1390**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-17T11:50:32.000Z",
"updated_at": "2023-11-17T11:50:43.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-17T11:50:32.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78787,
"currency_name": "USD",
"currency_rate": "1125 / 1135**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-17T11:50:32.000Z",
"updated_at": "2023-11-17T11:50:42.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-17T11:50:32.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-17 04:14:23": [
{
"id": 78786,
"currency_name": "EUR",
"currency_rate": "1170 / 1180*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-17T04:14:23.000Z",
"updated_at": "2023-11-17T04:15:46.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-17T07:14:23.000Z",
"interval_minutes": 180,
"dealer_name": ""
},
{
"id": 78785,
"currency_name": "GBP",
"currency_rate": "1380 / 1390*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-17T04:14:23.000Z",
"updated_at": "2023-11-17T04:15:46.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-17T07:14:23.000Z",
"interval_minutes": 180,
"dealer_name": ""
},
{
"id": 78784,
"currency_name": "USD",
"currency_rate": "1125 / 1135*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-17T04:14:23.000Z",
"updated_at": "2023-11-17T04:15:46.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-17T07:14:23.000Z",
"interval_minutes": 180,
"dealer_name": ""
}
],
"2023-11-16 17:19:56": [
{
"id": 78747,
"currency_name": "EUR",
"currency_rate": "1180 / 1190***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-16T17:19:56.000Z",
"updated_at": "2023-11-16T17:21:40.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-16T17:59:56.000Z",
"interval_minutes": 40,
"dealer_name": ""
},
{
"id": 78746,
"currency_name": "GBP",
"currency_rate": "1380 / 1390***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-16T17:19:56.000Z",
"updated_at": "2023-11-16T17:21:40.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-16T17:59:56.000Z",
"interval_minutes": 40,
"dealer_name": ""
},
{
"id": 78745,
"currency_name": "USD",
"currency_rate": "1125 / 1135***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-16T17:19:56.000Z",
"updated_at": "2023-11-16T17:21:40.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-16T17:59:56.000Z",
"interval_minutes": 40,
"dealer_name": ""
}
],
"2023-11-16 11:31:40": [
{
"id": 78741,
"currency_name": "EUR",
"currency_rate": "1170 / 1180**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-16T11:31:40.000Z",
"updated_at": "2023-11-16T11:33:06.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-16T11:31:40.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78740,
"currency_name": "GBP",
"currency_rate": "1370 / 1380**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-16T11:31:40.000Z",
"updated_at": "2023-11-16T11:33:05.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-16T11:31:40.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78739,
"currency_name": "USD",
"currency_rate": "1125 / 1135**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-16T11:31:40.000Z",
"updated_at": "2023-11-16T11:33:04.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-16T11:31:40.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-16 08:39:47": [
{
"id": 78738,
"currency_name": "EUR",
"currency_rate": "1165 / 1175*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-16T08:39:47.000Z",
"updated_at": "2023-11-16T08:39:58.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-16T08:39:47.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78737,
"currency_name": "GBP",
"currency_rate": "1370 / 1380*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-16T08:39:47.000Z",
"updated_at": "2023-11-16T08:39:57.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-16T08:39:47.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78736,
"currency_name": "USD",
"currency_rate": "1125 / 1135*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-16T08:39:47.000Z",
"updated_at": "2023-11-16T08:39:56.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-16T08:39:47.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-15 17:09:30": [
{
"id": 78699,
"currency_name": "EUR",
"currency_rate": "1165 / 1175***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-15T17:09:30.000Z",
"updated_at": "2023-11-15T17:10:52.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-15T17:59:30.000Z",
"interval_minutes": 50,
"dealer_name": ""
},
{
"id": 78698,
"currency_name": "GBP",
"currency_rate": "1370 / 1380***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-15T17:09:30.000Z",
"updated_at": "2023-11-15T17:10:52.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-15T17:59:30.000Z",
"interval_minutes": 50,
"dealer_name": ""
},
{
"id": 78697,
"currency_name": "USD",
"currency_rate": "1125 / 1135***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-15T17:09:30.000Z",
"updated_at": "2023-11-15T17:10:52.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-15T17:59:30.000Z",
"interval_minutes": 50,
"dealer_name": ""
}
],
"2023-11-15 10:37:31": [
{
"id": 78693,
"currency_name": "EUR",
"currency_rate": "1165 / 1175**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-15T10:37:31.000Z",
"updated_at": "2023-11-15T10:38:57.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-15T10:37:31.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78692,
"currency_name": "GBP",
"currency_rate": "1370 / 1380**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-15T10:37:31.000Z",
"updated_at": "2023-11-15T10:38:56.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-15T10:37:31.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78691,
"currency_name": "USD",
"currency_rate": "1125 / 1135**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-15T10:37:31.000Z",
"updated_at": "2023-11-15T10:38:54.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-15T10:37:31.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-15 08:53:26": [
{
"id": 78690,
"currency_name": "EUR",
"currency_rate": "1150 / 1160*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-15T08:53:26.000Z",
"updated_at": "2023-11-15T08:54:48.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-15T08:53:26.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78689,
"currency_name": "GBP",
"currency_rate": "1350 / 1360*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-15T08:53:26.000Z",
"updated_at": "2023-11-15T08:54:48.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-15T08:53:26.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78688,
"currency_name": "USD",
"currency_rate": "1125 / 1135*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-15T08:53:26.000Z",
"updated_at": "2023-11-15T08:54:48.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-15T08:53:26.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-14 17:48:49": [
{
"id": 78656,
"currency_name": "EUR",
"currency_rate": "1150 / 1160***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-14T17:48:49.000Z",
"updated_at": "2023-11-14T17:49:16.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-14T17:48:49.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78655,
"currency_name": "GBP",
"currency_rate": "1350 / 1360***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-14T17:48:49.000Z",
"updated_at": "2023-11-14T17:49:00.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-14T17:48:49.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78654,
"currency_name": "USD",
"currency_rate": "1125 / 1135***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-14T17:48:49.000Z",
"updated_at": "2023-11-14T17:50:11.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-14T17:48:49.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-14 12:51:05": [
{
"id": 78642,
"currency_name": "EUR",
"currency_rate": "1150 / 1160**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-14T12:51:05.000Z",
"updated_at": "2023-11-14T12:52:31.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-14T12:51:05.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78641,
"currency_name": "GBP",
"currency_rate": "1350 / 1360**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-14T12:51:05.000Z",
"updated_at": "2023-11-14T17:49:33.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-14T12:51:05.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78640,
"currency_name": "USD",
"currency_rate": "1125 / 1135**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-14T12:51:05.000Z",
"updated_at": "2023-11-14T12:52:28.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-14T12:51:05.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-14 07:35:59": [
{
"id": 78639,
"currency_name": "EUR",
"currency_rate": "1150 / 1170*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-14T07:35:59.000Z",
"updated_at": "2023-11-14T07:36:13.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-14T07:35:59.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78638,
"currency_name": "GBP",
"currency_rate": "1345 / 1355*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-14T07:35:59.000Z",
"updated_at": "2023-11-14T07:36:12.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-14T07:35:59.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78637,
"currency_name": "USD",
"currency_rate": "1130 / 1140*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-14T07:35:59.000Z",
"updated_at": "2023-11-14T07:36:11.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-14T07:35:59.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-13 16:52:28": [
{
"id": 78608,
"currency_name": "EUR",
"currency_rate": "1150 / 1170***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-13T16:52:28.000Z",
"updated_at": "2023-11-13T16:54:05.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-13T17:52:28.000Z",
"interval_minutes": 60,
"dealer_name": ""
},
{
"id": 78607,
"currency_name": "GBP",
"currency_rate": "1345 / 1355***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-13T16:52:28.000Z",
"updated_at": "2023-11-13T16:54:05.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-13T17:52:28.000Z",
"interval_minutes": 60,
"dealer_name": ""
},
{
"id": 78606,
"currency_name": "USD",
"currency_rate": "1132 / 1140***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-13T16:52:28.000Z",
"updated_at": "2023-11-13T16:54:05.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-13T17:52:28.000Z",
"interval_minutes": 60,
"dealer_name": ""
}
],
"2023-11-13 11:25:41": [
{
"id": 78594,
"currency_name": "EUR",
"currency_rate": "1150 / 1170**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-13T11:25:41.000Z",
"updated_at": "2023-11-13T12:07:43.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-13T11:25:41.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78593,
"currency_name": "GBP",
"currency_rate": "1345 / 1355**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-13T11:25:41.000Z",
"updated_at": "2023-11-13T12:21:48.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-13T11:25:41.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78592,
"currency_name": "USD",
"currency_rate": "1132 / 1140**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-13T11:25:41.000Z",
"updated_at": "2023-11-13T12:07:43.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-13T11:25:41.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-13 09:02:37": [
{
"id": 78591,
"currency_name": "EUR",
"currency_rate": "1130 / 1160*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-13T09:02:37.000Z",
"updated_at": "2023-11-13T09:02:51.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-13T09:02:37.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78590,
"currency_name": "GBP",
"currency_rate": "1340 / 1355*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-13T09:02:37.000Z",
"updated_at": "2023-11-13T09:02:50.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-13T09:02:37.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78589,
"currency_name": "USD",
"currency_rate": "1100 / 1120*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-13T09:02:37.000Z",
"updated_at": "2023-11-13T09:02:49.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-13T09:02:37.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-10 17:52:16": [
{
"id": 78485,
"currency_name": "EUR",
"currency_rate": "1130 / 1160***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-10T17:52:16.000Z",
"updated_at": "2023-11-10T17:53:40.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-10T17:52:16.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78484,
"currency_name": "GBP",
"currency_rate": "1340 / 1355***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-10T17:52:16.000Z",
"updated_at": "2023-11-10T18:31:24.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-10T17:52:16.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78483,
"currency_name": "USD",
"currency_rate": "1100 / 1120***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-10T17:52:16.000Z",
"updated_at": "2023-11-10T17:53:38.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-10T17:52:16.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-10 11:50:31": [
{
"id": 78482,
"currency_name": "EUR",
"currency_rate": "1130 / 1160**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-10T11:50:31.000Z",
"updated_at": "2023-11-10T11:51:55.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-10T11:50:31.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78481,
"currency_name": "GBP",
"currency_rate": "1340 / 1350**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-10T11:50:31.000Z",
"updated_at": "2023-11-10T11:51:54.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-10T11:50:31.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78480,
"currency_name": "USD",
"currency_rate": "1100 / 1120**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-10T11:50:31.000Z",
"updated_at": "2023-11-10T11:51:53.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-10T11:50:31.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-10 08:13:20": [
{
"id": 78479,
"currency_name": "EUR",
"currency_rate": "1150 / 1190*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-10T08:13:20.000Z",
"updated_at": "2023-11-10T08:14:40.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-10T08:13:20.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78478,
"currency_name": "GBP",
"currency_rate": "1300 / 1350*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-10T08:13:20.000Z",
"updated_at": "2023-11-10T08:15:27.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-10T08:13:20.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78477,
"currency_name": "USD",
"currency_rate": "1100 / 1130*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-10T08:13:20.000Z",
"updated_at": "2023-11-10T08:14:40.000Z",
"push_notification": null,
"scheduled": null,
"publish_time": "2023-11-10T08:13:20.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-09 17:21:25": [
{
"id": 78448,
"currency_name": "EUR",
"currency_rate": "1150 / 1190***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-09T17:21:25.000Z",
"updated_at": "2023-11-09T17:24:33.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-09T17:51:25.000Z",
"interval_minutes": 30,
"dealer_name": ""
},
{
"id": 78447,
"currency_name": "GBP",
"currency_rate": "1300 / 1350***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-09T17:21:25.000Z",
"updated_at": "2023-11-09T17:24:33.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-09T17:51:25.000Z",
"interval_minutes": 30,
"dealer_name": ""
},
{
"id": 78446,
"currency_name": "USD",
"currency_rate": "1120 / 1130***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-09T17:21:25.000Z",
"updated_at": "2023-11-09T17:24:33.000Z",
"push_notification": true,
"scheduled": true,
"publish_time": "2023-11-09T17:51:25.000Z",
"interval_minutes": 30,
"dealer_name": ""
}
],
"2023-11-09 11:24:01": [
{
"id": 78442,
"currency_name": "EUR",
"currency_rate": "1170 / 1200**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-09T11:24:01.000Z",
"updated_at": "2023-11-09T11:25:24.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-09T11:24:01.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78441,
"currency_name": "GBP",
"currency_rate": "1300 / 1350**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-09T11:24:01.000Z",
"updated_at": "2023-11-09T11:25:23.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-09T11:24:01.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78440,
"currency_name": "USD",
"currency_rate": "1120 / 1130**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-09T11:24:01.000Z",
"updated_at": "2023-11-09T11:25:22.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-09T11:24:01.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-09 08:11:40": [
{
"id": 78439,
"currency_name": "EUR",
"currency_rate": "1170 / 1200*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-09T08:11:40.000Z",
"updated_at": "2023-11-09T08:11:53.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-09T08:11:40.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78438,
"currency_name": "GBP",
"currency_rate": "1300 / 1350*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-09T08:11:40.000Z",
"updated_at": "2023-11-09T08:11:52.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-09T08:11:40.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78437,
"currency_name": "USD",
"currency_rate": "1160 / 1170*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-09T08:11:40.000Z",
"updated_at": "2023-11-09T08:11:51.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-09T08:11:40.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-08 18:18:15": [
{
"id": 78399,
"currency_name": "EUR",
"currency_rate": "1170 / 1200***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-08T18:18:15.000Z",
"updated_at": "2023-11-08T18:19:38.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T18:18:15.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78398,
"currency_name": "GBP",
"currency_rate": "1300 / 1350***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-08T18:18:15.000Z",
"updated_at": "2023-11-08T18:19:37.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T18:18:15.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78397,
"currency_name": "USD",
"currency_rate": "1160 / 1170***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-08T18:18:15.000Z",
"updated_at": "2023-11-08T18:19:36.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T18:18:15.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-08 11:28:06": [
{
"id": 78388,
"currency_name": "EUR",
"currency_rate": "1170 / 1200**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-08T11:28:06.000Z",
"updated_at": "2023-11-08T12:53:00.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T11:28:06.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78387,
"currency_name": "GBP",
"currency_rate": "1300 / 1350**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-08T11:28:06.000Z",
"updated_at": "2023-11-08T12:52:59.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T11:28:06.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78386,
"currency_name": "USD",
"currency_rate": "1160 / 1170**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-08T11:28:06.000Z",
"updated_at": "2023-11-08T11:28:50.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T11:28:06.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-08 07:30:12": [
{
"id": 78385,
"currency_name": "EUR",
"currency_rate": "1120 / 1150*",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-08T07:30:12.000Z",
"updated_at": "2023-11-08T09:23:32.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T07:30:12.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78384,
"currency_name": "GBP",
"currency_rate": "1260 / 1280*",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-08T07:30:12.000Z",
"updated_at": "2023-11-08T09:23:31.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T07:30:12.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78383,
"currency_name": "USD",
"currency_rate": "1085 / 1095*",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-08T07:30:12.000Z",
"updated_at": "2023-11-08T09:23:30.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-08T07:30:12.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-07 17:44:07": [
{
"id": 78349,
"currency_name": "EUR",
"currency_rate": "1100 / 1130***",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-07T17:44:07.000Z",
"updated_at": "2023-11-07T17:45:30.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-07T17:44:07.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78348,
"currency_name": "GBP",
"currency_rate": "1250 / 1270***",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-07T17:44:07.000Z",
"updated_at": "2023-11-07T17:45:29.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-07T17:44:07.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78347,
"currency_name": "USD",
"currency_rate": "1050 / 1070***",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-07T17:44:07.000Z",
"updated_at": "2023-11-07T17:45:27.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-07T17:44:07.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
],
"2023-11-07 12:27:14": [
{
"id": 78343,
"currency_name": "EUR",
"currency_rate": "1100 / 1130**",
"currency_type": "LogosParallel",
"currency_flag": "EUR",
"created_at": "2023-11-07T12:27:14.000Z",
"updated_at": "2023-11-07T12:27:32.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-07T12:27:14.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78342,
"currency_name": "GBP",
"currency_rate": "1250 / 1270**",
"currency_type": "LogosParallel",
"currency_flag": "GBP",
"created_at": "2023-11-07T12:27:14.000Z",
"updated_at": "2023-11-07T12:27:31.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-07T12:27:14.000Z",
"interval_minutes": 0,
"dealer_name": ""
},
{
"id": 78341,
"currency_name": "USD",
"currency_rate": "1050 / 1070**",
"currency_type": "LogosParallel",
"currency_flag": "USD",
"created_at": "2023-11-07T12:27:14.000Z",
"updated_at": "2023-11-07T12:27:30.000Z",
"push_notification": true,
"scheduled": null,
"publish_time": "2023-11-07T12:27:14.000Z",
"interval_minutes": 0,
"dealer_name": ""
}
]
}
}''';
