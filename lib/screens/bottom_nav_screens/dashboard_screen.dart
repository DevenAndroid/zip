import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../../controller/profile_controller.dart';
import '../../controller/update_user.dart';
import '../../repository/myprofile_repo.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final profileController = Get.put(ProfileController());
  final RegisterController = Get.put(registerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData1();
    profileController.getCurrentBalance();
    RegisterController.getSetting();
    getData();
    profileController.getCard();
    profileController.getData();
    // getData1();
  }

  getData() {
    myProfileRepo().then((value) {
      profileController.modal.value = value;
      if (value.status == true) {
        if (profileController.modal.value.data!.user!.isAfricaVerifed ==
            false) {
          Get.offAllNamed(MyRouters.notVerifyAfricaScreen);
        }
        print(value.message.toString());
      }
    });
  }

  getData1() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('HideBalance') == true) {
      registorController.isValue = true;
    } else {
      registorController.isValue = false;
    }
  }

  final formKeyVerify = GlobalKey<FormState>();
  final registorController = Get.put(registerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0F7),
      body: Obx(() {
        return profileController.modal.value.status == true &&
                profileController.currentBalanceModel.value.status == true
            ? RefreshIndicator(
                color: Colors.white,
                backgroundColor: AppTheme.primaryColor,
                onRefresh: () async {
                  profileController.getCurrentBalance();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            boxShadow: [
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Hi, ' +
                                  '${profileController.modal.value.data!.user!.fname.toString()} 👋 ',
                              style: const TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Welcome to ZIP',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF777777),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(MyRouters.accountsInBank);
                                  },
                                  child: Container(
                                    width: size.width * .47,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/images/zipbg.png")),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          FittedBox(
                                            child: InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    MyRouters.accountsInBank);
                                              },
                                              child: Text(
                                                "Current Balance",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF2E2E2E),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  MyRouters.accountsInBank);
                                            },
                                            child: profileController
                                                        .currentBalanceModel
                                                        .value
                                                        .data!
                                                        .setting!
                                                        .hideBalance! !=
                                                    true
                                                ? Expanded(
                                                    child: FittedBox(
                                                      child: Row(
                                                        children: [
                                                          Image.network(
                                                            "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                            color: Colors.black,
                                                            width: 20,
                                                            height: 20,
                                                          ),
                                                          FittedBox(
                                                            child: Expanded(
                                                              child: Text(
                                                                // profileController
                                                                //     .currentBalanceModel
                                                                //     .value
                                                                //     .data!
                                                                //     .currentBalance!
                                                                //     .toStringAsFixed(2),
                                                                NumberFormat(
                                                                        '#,##0.00')
                                                                    .format(profileController
                                                                        .currentBalanceModel
                                                                        .value
                                                                        .data!
                                                                        .currentBalance!),
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                          ),
                                          const SizedBox(
                                            height: 17,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  MyRouters.accountsInBank);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/swap.svg',
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward_rounded,
                                                  size: 25,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            MyRouters.addRecipientsStart);
                                      },
                                      child: Container(
                                        width: size.width * .45,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF1D1D1D),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Add Cash",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(
                                                Icons.arrow_downward,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            MyRouters.sendCashYourBalance);
                                      },
                                      child: Container(
                                        width: size.width * .45,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF1D1D1D),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Cash Out",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SvgPicture.asset(
                                                  "assets/images/arrow.svg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My ZIP',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2E2E2E)),
                                ),
                              ),
                              Text(
                                'What would you like to do today?',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF1D1D1D)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(MyRouters.loanScreen);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            border: Border.all(
                                                color: const Color(0xFFD3D3D6)),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.1,
                                                  0.1,
                                                ), //Offset
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/banktransfer.svg",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/arrowr.svg",
                                                  width: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                            // SvgPicture.asset(
                                            //   "assets/images/banktransfer.svg",
                                            //   width: 30,
                                            // ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                'Loans\n',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF1D1D1D)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(MyRouters.supportScreen);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: const Color(0xFFD3D3D6)),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.1,
                                                  0.1,
                                                ), //Offset
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/coustmersupport.svg",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/arrowr.svg",
                                                  width: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                'Customer\nSupport',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF1D1D1D)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(MyRouters.telcosScreen);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            border: Border.all(
                                                color: const Color(0xFFD3D3D6)),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.1,
                                                  0.1,
                                                ), //Offset
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/i3.svg",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/arrowr.svg",
                                                  width: 25,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                'Buy\nAirtime',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF1D1D1D)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            MyRouters.meterVerifyScreen);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            border: Border.all(
                                                color: const Color(0xFFD3D3D6)),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.1,
                                                  0.1,
                                                ), //Offset
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/i4.svg",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/arrowr.svg",
                                                  width: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                'Buy\nElectricity',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF1D1D1D)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(MyRouters.cabelTvScreen);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            border: Border.all(
                                                color: const Color(0xFFD3D3D6)),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.1,
                                                  0.1,
                                                ), //Offset
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/cabeltv.svg",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/arrowr.svg",
                                                  width: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                'Buy \nCable Tv',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF1D1D1D)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(MyRouters.buyDataScreen);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFAFA),
                                            border: Border.all(
                                                color: const Color(0xFFD3D3D6)),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(
                                                  0.1,
                                                  0.1,
                                                ), //Offset
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/i5.svg",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/arrowr.svg",
                                                  width: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                'Buy Internet\nData',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF1D1D1D)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  // /   RegisterController.accountVritual(context);
                                  Get.toNamed(MyRouters.currencyConvert);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rates',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1D1D1D)),
                                          ),
                                        ),
                                        Text(
                                          'See current exchange rates at a glance',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF777777)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          Get.toNamed(MyRouters.requestMoney1);
                                        },
                                        child: const CustomOutlineButton(
                                          title: "Request",
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Get.toNamed(MyRouters.sendCashReciptant);
                                      // Get.toNamed(MyRouters.sendCash1);
                                    },
                                    child: CustomOutlineBoder(
                                      title: "Send",
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
                                height: 100,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
