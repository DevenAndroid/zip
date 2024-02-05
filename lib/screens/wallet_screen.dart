import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import 'bottom_nav_screens/wallet_screen.dart';
import 'mycard.dart';

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final controller = Get.put(registerController());
  final controller1 = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.getCard().then((value) {
      setState(() {});
    });
    // controller1. getCardDetails();

    // controller1. getData();
    // controller1. getCardDetails();
  }

  @override
  Widget build(BuildContext context) {
    return controller1.card.value.data == null
        ? const WalletScreen1()
        : MyCard();
  }
}
