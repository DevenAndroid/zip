import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zip/screens/dashboard_screen.dart';
import '../screens/OB_screen.dart';
import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var oBScreen = "/oBScreen";

  static var route = [
    GetPage(name: '/', page: () =>  const DashBoard()),

  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),

  ];
}