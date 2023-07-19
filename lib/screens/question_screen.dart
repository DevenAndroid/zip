import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/my_routers.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
    "Questions",
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
    body:  SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(height: 10,),
      Text(
        "Please answer some questions",
        style: GoogleFonts.poppins(
            color:  Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 10,),
      Text(
        "We need some more info first to see what we can offer. answering these questions won’t affect your score.",
        style: GoogleFonts.poppins(
            color:  const Color(0xFF343434),
            fontSize: 15,
            fontWeight: FontWeight.w500),
      ),
    const SizedBox(height: 20,),
    Container(
      width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(12),

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.grey),

    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      Text(
        "Please answer some questions",
        style: GoogleFonts.poppins(
            color:  const Color(0xFF5A5656),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      Text(
        "SELECT",
        style: GoogleFonts.poppins(
            color:  const Color(0xFFB2802A),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
]
    )),
      const SizedBox(height: 20,),
      Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),

          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  "Residential status",
                  style: GoogleFonts.poppins(
                      color:  const Color(0xFF5A5656),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "SELECT",
                  style: GoogleFonts.poppins(
                      color:  const Color(0xFFB2802A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
             const Divider(thickness: 1,color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Annual income before tax",
                      style: GoogleFonts.poppins(
                          color:  const Color(0xFF5A5656),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),

SvgPicture.asset('assets/images/i.svg')
                  ],
                ),
                Row(

                  children: [
                    Text(
                      "\$",
                      style: GoogleFonts.poppins(
                          color:  const Color(0xFF000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 2,),
                    Expanded(
                      child: TextField(

                        decoration: new InputDecoration(
                          contentPadding: const EdgeInsets.all(3.0),
                          isDense: true,
                            hintText: "0",
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintStyle:
                           GoogleFonts.poppins(
                              color:  const Color(0xFF5A5656),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),

                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Text(
                  "Is your income likely to go down in the near future?",
                  style: GoogleFonts.poppins(
                      color:  const Color(0xFF5A5656),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 7,),
                Text(
                  "SELECT",
                  style: GoogleFonts.poppins(
                      color:  const Color(0xFFB2802A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ]
          )),
      const SizedBox(height: 20,),
      Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),

          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  "Does anyone rely on you financially? like your partner, childrean or relatives",
                  style: GoogleFonts.poppins(
                      color:  const Color(0xFF5A5656),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "SELECT",
                  style: GoogleFonts.poppins(
                      color:  const Color(0xFFB2802A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ]
          )),
      const SizedBox(height: 15,),
      Text(
        "Learn about how we use your data",
        style: GoogleFonts.poppins(
            color:  const Color(0xFFB2802A),
            fontSize: 15,
            fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 15,),
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.secondaryColor),
            color: const Color(0xFFB2802A).withOpacity(.15)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/lock3.svg"),
              const SizedBox(width: 5,),
              Expanded(
                child: Text(
                  "Scroll down to check all your details. submitting won’t impact your credit score.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),

                ),
              ),

            ],
          ),
        ),


      ),
      const SizedBox(height: 15,),
      InkWell(
          onTap: (){
            Get.toNamed(MyRouters.eligibleScreen);
            // emailLogin();
            //
          },
          child: const CustomOutlineButton(title: "Sumbit",)),
      const SizedBox(height: 15,),
    ])
    ))
    );
  }
}
