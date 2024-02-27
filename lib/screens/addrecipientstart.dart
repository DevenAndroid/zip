import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/update_user.dart';

class AddRecipientStart extends StatefulWidget {
  const AddRecipientStart({Key? key}) : super(key: key);

  @override
  State<AddRecipientStart> createState() => _AddRecipientStartState();
}

class _AddRecipientStartState extends State<AddRecipientStart> {
  final registorController = Get.put(registerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
        elevation: 0,
        title: Text(
          "Add Fund ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 39,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.accountsInBank);
                      },
                      child: Container(
                        height: 167,
                        width: 167,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0), //(x,y)
                                blurRadius: 0.0,
                              ),
                            ],
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFD3D3D6)),
                            borderRadius: BorderRadius.circular(21)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: SvgPicture.asset(
                                    'assets/images/blacklogo.svg',
                                    height: 55,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20, top: 0),
                                  child: SvgPicture.asset(
                                      "assets/images/arrowr.svg"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Text(
                                "Zip\nAccount",
                                style: GoogleFonts.poppins(
                                    height: 1.4,
                                    color: const Color(0xFF2E2E2E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.regularTransfer);
                      },
                      child: Container(
                        height: 167,
                        width: 167,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0), //(x,y)
                                blurRadius: 0.0,
                              ),
                            ],
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFD3D3D6)),
                            borderRadius: BorderRadius.circular(21)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: SvgPicture.asset(
                                    'assets/images/banklogo.svg',
                                    height: 55,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20, top: 0),
                                  child: SvgPicture.asset(
                                      "assets/images/arrowr.svg"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Text(
                                "Bank\nAccount",
                                style: GoogleFonts.poppins(
                                    height: 1.4,
                                    color: const Color(0xFF2E2E2E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(MyRouters.verifyPaymentLink);
                },
                child: Container(
                  height: 167,
                  width: 160,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 0.0,
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFD3D3D6)),
                      borderRadius: BorderRadius.circular(21)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0),
                            child: SvgPicture.asset(
                              'assets/images/paycard.svg',
                              height: 55,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20, top: 0),
                            child: SvgPicture.asset("assets/images/arrowr.svg"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Pay\nBy Card",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF2E2E2E),
                              height: 1.4,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
