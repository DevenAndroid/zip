import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';



class SendCashReciptant extends StatefulWidget {
  const SendCashReciptant({Key? key}) : super(key: key);

  @override
  State<SendCashReciptant> createState() => _SendCashReciptantState();
}

class _SendCashReciptantState extends State<SendCashReciptant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Send Money",
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search,color: Colors.black,),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 39,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  // Get.toNamed(MyRouters.yourRecipient);
                  Get.toNamed(MyRouters.createRecipients);
                },
                child: Container(

                  height: 148,
                  width: 148,
                  decoration: BoxDecoration(
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
                  Get.toNamed(MyRouters.sendCash2);
                },
                child: Container(

                  height: 148,
                  width: 148,
                  decoration: BoxDecoration(
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
                        "Other Bank",
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
        ],
      ),
    );
  }
}
