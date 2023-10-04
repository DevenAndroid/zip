import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      registorController.fetchVritualAccount();});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          onTap: (){
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed(MyRouters.accountsInBank);
                  },
                  child: Container(

                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0), //(x,y)
                            blurRadius: 0.0,
                          ),
                        ],
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(21)),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6, top: 7),
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Image.asset(
                          'assets/images/blacklogo.png',
                          height: 55,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Zip Account",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(MyRouters.regularTransfer);
                  },
                  child: Container(

                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0), //(x,y)
                            blurRadius: 0.0,
                          ),
                        ],
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(21)),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6, top: 7),
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Image.asset(
                          'assets/images/banklogo.png',
                          height: 55,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bank Account",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.verifyPaymentLink);
                },
                child: Container(

                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 0.0,
                        ),
                      ],
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(21)),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 6, top: 7),
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Image.asset(
                        'assets/images/link2.png',
                        height: 55,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pay By Card",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,),



          ],
        ),
      ),
    );
  }
}
