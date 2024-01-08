import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/model_freeze_card.dart';
import '../repository/freeze_card_repo.dart';
import '../routers/my_routers.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';
import 'add_card.dart';
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
    return controller1.card.value.data == null ? WalletScreen1() : MyCard();
  }
}
