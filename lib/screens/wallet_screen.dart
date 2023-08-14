import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';


import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';
import 'add_card.dart';

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
    controller1. getData();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Wallet",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {},
                          child: const CustomOutlineButton(
                            title: "Cards",
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            // Get.toNamed(MyRouters.mobileNumber);
                          },
                          child: CustomOutlineBoder(
                            title: "Account",
                            backgroundColor: Colors.white,
                            textColor: AppTheme.buttonColor,
                            onPressed: () {
                              Get.toNamed(MyRouters.mobileNumber);
                            },
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 33,
                ),
                CarouselSlider(
                  items: [
                    Card(
                      elevation: 4.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Container(
                        height: 180,
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 0, bottom: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 18, top: 17),
                              child: Image.asset(
                                "assets/images/walletlogo.png",
                                height: 45,
                                width: 44,
                              ),
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const CircleAvatar(
                                  maxRadius: 4,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Card Holder Name',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '--',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Expiry date',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '--/--',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/round2.png",
                                      height: 35,
                                      width: 35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Image.asset(
                                        "assets/images/round1.png",
                                        height: 35,
                                        width: 34,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Container(

                    padding: const EdgeInsets.all(8),
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xff1D1D1D))),
                    child: Row(

                      children: [
const SizedBox(width: 5,),
                        Image.asset(
                          "assets/images/Group.png",
                          height: 45,
                          width: 44,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get your Virtual Card',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1D1D),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Rem nemo rerum sint dolor quae repellat.',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1D1D),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .25,
                ),
                InkWell(
                  onTap: (){
                    controller1. holder();
                  },
                  child: CustomOutlineButton(
                    title: "Add Card",

                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ]),
        )));
  }
}
