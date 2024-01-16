import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/details_pin.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../widgets/common_button.dart';

class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller1 = Get.put(ProfileController());
  final controller = Get.put(registerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller1. getCardDetails();
    controller1.getData();
    controller1.getCard();

    // controller1.getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Wallet",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              // Get.toNamed(MyRouters.walletScreen1);
            },
            child: const SizedBox()),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppTheme.primaryColor,
        onRefresh: () async {
          controller1.getCard();
          controller1.getBalance();
        },
        child: Obx(() {
          return controller1.statusOfCard.value.isSuccess
              ? SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Your Balance",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.network("https://cdn-icons-png.flaticon.com/512/32/32974.png",color: Colors.black,width: 15,height: 15,),

                          Text(
                            "\$" + controller1.fundText.toString(),
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      CarouselSlider(
                        items: [
                          Card(
                            elevation: 3.0,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 17),
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
                                      if (controller1.card.value.data ==
                                          null) ...[
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
                                      ] else
                                        Text(
                                          controller1.card.value.data!.last4
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ],
                                  ),
                                  FittedBox(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Card Holder Name',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            if (controller1.card.value.data ==
                                                null)
                                              Text(
                                                '--',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            else
                                              Text(
                                                controller1
                                                    .card.value.data!.cardName
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Expiry date',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            if (controller1.card.value.data ==
                                                null)
                                              Text(
                                                '--/--',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            else
                                              Text(
                                                controller1.card.value.data!
                                                        .expiryMonth
                                                        .toString() +
                                                    "/" +
                                                    controller1.card.value.data!
                                                        .expiryYear
                                                        .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                              height: 30,
                                              width: 30,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Image.asset(
                                                "assets/images/round1.png",
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      // Text(
                      //   "This card will expire in 7 months",
                      //   style: GoogleFonts.poppins(
                      //       color: const Color(0xFF1D1D1D),
                      //       fontSize: 13,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      // const SizedBox(
                      //   height: 11,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     controller.contactUpdateCard(context);
                      //     // controller1. holder();
                      //   },
                      //   child: const SizedBox(
                      //     width: 200,
                      //     child: CustomOutlineButton(
                      //       title: "Order a new card",
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              // Get.toNamed(MyRouters.addFundScreen);
                              Get.toNamed(MyRouters.addFundExchange);
                            },
                            child: Container(
                              height: 98,
                              width: 98,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(
                                        0.5,
                                        0.5,
                                      ), //Offset
                                      blurRadius: 0.5,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                  Text(
                                    "Add Money",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF2E2E2E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // controller1.getCardDetails();
                              Get.to(()=>const DetailsPinScreen());
                            },
                            child: Container(
                              height: 98,
                              width: 98,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(
                                        0.5,
                                        0.5,
                                      ), //Offset
                                      blurRadius: 0.5,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.credit_card,
                                    size: 40,
                                  ),
                                  Text(
                                    "Card Details",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF2E2E2E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          controller1.cardUnFreeze.value.status == "success"
                              ? InkWell(
                                  onTap: () {
                                    showDialogueDelete();
                                  },
                                  child: Container(
                                    height: 98,
                                    width: 98,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(
                                              0.5,
                                              0.5,
                                            ), //Offset
                                            blurRadius: 0.5,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.ac_unit,
                                          size: 40,
                                        ),
                                        Text(
                                          "Freeze card",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF2E2E2E),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : controller1.cardFreeze.value.status == "success"
                                  ? InkWell(
                                      onTap: () {
                                        showDialogueDelete1();
                                      },
                                      child: Container(
                                        height: 98,
                                        width: 98,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.5,
                                                  0.5,
                                                ), //Offset
                                                blurRadius: 0.5,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.ac_unit,
                                              size: 40,
                                            ),
                                            Text(
                                              "Unfreez card",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF2E2E2E),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        showDialogueDelete();
                                      },
                                      child: Container(
                                        height: 98,
                                        width: 98,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.5,
                                                  0.5,
                                                ), //Offset
                                                blurRadius: 0.5,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.ac_unit,
                                              size: 40,
                                            ),
                                            Text(
                                              "Freeze card",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF2E2E2E),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                        ],
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: InkWell(
                            onTap: () {
                              // Get.toNamed(MyRouters.buyServices);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 49,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppTheme.buttonColor, width: 1.3)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add to ",
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.buttonColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SvgPicture.asset('assets/images/google.svg'),
                                  Text(
                                    " Pay",
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.buttonColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          showDialogueDelete2();
                          // controller.contactUpdateCard(context);
                          // controller1. holder();
                        },
                        child: const SizedBox(
                          width: 200,
                          child: CustomOutlineButton(
                            title: "Delete card ",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ))
              : controller1.statusOfCard.value.isError
                  ? const Center(child: Text("Please contact customer support"))
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
        }),
      ),
    );
  }

  showDialogueDelete() {
    showDialog(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          double doubleVar;
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Form(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.back();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.buttonColor,
                            ),
                            child: const Icon(
                              Icons.clear,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Text(
                                'Are You Sure you want to freeze your card !',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF4F537A),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // Text(
                          //   'Click on yes to freeze your card',
                          //   style: GoogleFonts.poppins(
                          //       color: const Color(0xFF4F537A),
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w500),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(MyRouters.prescription);
                                },
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        Get.back();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppTheme.buttonColor),
                                        color: const Color(0xffffffffff),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            color: AppTheme.buttonColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      controller1.frozenCard();
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppTheme.buttonColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  showDialogueDelete1() {
    showDialog(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          double doubleVar;
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Form(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.back();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.buttonColor,
                            ),
                            child: const Icon(
                              Icons.clear,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Text(
                                'Are You Sure you want to Unfreeze your card !',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF4F537A),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // Text(
                          //   'Click on yes to freeze your card',
                          //   style: GoogleFonts.poppins(
                          //       color: const Color(0xFF4F537A),
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w500),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(MyRouters.prescription);
                                },
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        Get.back();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppTheme.buttonColor),
                                        color: const Color(0xffffffffff),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            color: AppTheme.buttonColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      controller1.unFrozenCard();
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppTheme.buttonColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  showDialogueDelete2() {
    showDialog(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          double doubleVar;
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Form(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.back();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.buttonColor,
                            ),
                            child: const Icon(
                              Icons.clear,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Text(
                                'Are You Sure you want to Delete your card !',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF4F537A),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // Text(
                          //   'Click on yes to freeze your card',
                          //   style: GoogleFonts.poppins(
                          //       color: const Color(0xFF4F537A),
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w500),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(MyRouters.prescription);
                                },
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        Get.back();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppTheme.buttonColor),
                                        color: const Color(0xffffffffff),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            color: AppTheme.buttonColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      controller1.delete();
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppTheme.buttonColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
