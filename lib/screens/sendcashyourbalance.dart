import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class SendCashYourBalance extends StatefulWidget {
  const SendCashYourBalance({Key? key}) : super(key: key);

  @override
  State<SendCashYourBalance> createState() => _SendCashYourBalanceState();
}

class _SendCashYourBalanceState extends State<SendCashYourBalance> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Balance",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "\$276.00",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(
                    right: size.width * .01, left: size.width * .015),
                child: CircleAvatar(
                  radius: size.height * .07,
                  backgroundImage: const NetworkImage(
                      'https://www.pngitem.com/pimgs/m/128-1284293_marina-circle-girl-picture-in-circle-png-transparent.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xffF0D75F),
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: size.height * .015,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            "Joanne Daniel",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "+234 xxxxxxxxxx",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 29,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: CommonTextfield(
              obSecure: false,
              hintText: "200",
              labelText: "Amount",
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: CommonTextfield(
              obSecure: false,
              hintText: "What is it for?",
              labelText: "Note",
            ),
          ),
          SizedBox(
            height: size.height * .3,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(MyRouters.yourRecipient);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 8),
              child: CustomOutlineButton(
                title: "Send",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
