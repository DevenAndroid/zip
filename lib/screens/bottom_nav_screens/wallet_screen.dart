import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/profile_controller.dart';
import '../../controller/update_user.dart';
import '../../routers/my_routers.dart';
import '../../widgets/common_boder_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_colour.dart';

class WalletScreen1 extends StatefulWidget {
  const WalletScreen1({super.key});

  @override
  State<WalletScreen1> createState() => _WalletScreen1State();
}

class _WalletScreen1State extends State<WalletScreen1> {
  final controller = Get.put(registerController());
  final controller1 = Get.put(ProfileController());

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
          // leading: InkWell(
          //   onTap: (){
          //     Get.toNamed(MyRouters.bottomNavbar);
          //   },
          //   child: const Icon(
          //     Icons.arrow_back_rounded,
          //     color: AppTheme.primaryColor,
          //   ),
          // ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body:


        RefreshIndicator(
          color: Colors.white,
          backgroundColor: AppTheme.primaryColor,
          onRefresh: () async {
            controller1. getCard();


          },
          child: SingleChildScrollView(
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
                                  Get.toNamed(MyRouters.accountsInBank);
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
                                  left: 18.0, right: 15, bottom: 22.0),
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

                                      if(controller1.card.value.data==null)
                                        ...[
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
                                        ]
                                      else
                                        Text(controller1.card.value.data!.last4.toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.w600),)
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
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),

                                          if(controller1.card.value.data==null)
                                            Text(
                                              '--',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          else

                                            Text(
                                              controller1.card.value.data!.cardName.toString(),
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
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
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          if(controller1.card.value.data==null)
                                            Text(
                                              '--/--',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          else

                                            Text(
                                              controller1.card.value.data!.expiryMonth.toString()+"/"+  controller1.card.value.data!.expiryYear.toString(),
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
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
                          autoPlay: false,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          viewportFraction: 0.85,
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
                          // Get.toNamed(MyRouters.myCard);
                          controller1. holder();
                        },
                        child: const CustomOutlineButton(
                          title: "Add Card",

                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ]),
              )),
        ));
  }
}
