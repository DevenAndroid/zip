import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/OB_screen.dart';
import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var oBScreen = "/oBScreen";

  static var route = [
    GetPage(name: '/', page: () =>  const Splash()),

  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),

  ];
}