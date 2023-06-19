import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_textfield.dart';

class ChooseBank extends StatefulWidget {
  const ChooseBank({Key? key}) : super(key: key);

  @override
  State<ChooseBank> createState() => _ChooseBankState();
}

class _ChooseBankState extends State<ChooseBank> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
    appBar: AppBar(
    elevation: 0,
    backgroundColor: Colors.white,


    leading: InkWell(

    onTap: (){
    Get.back();
    },

    child: const Icon(
    Icons.arrow_back_rounded,
    // color: AppTheme.primaryColor,
    ),
    ),
    centerTitle: true,
    title: Text(
    "Choose Bank",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),


    ),

    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children
    :
    [
      CommonTextfield(obSecure: false, hintText: "Search for a bank",prefix: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/images/Search.svg",width: 10,),
      ),),
    SizedBox(height: 20,),
    ListView.builder(
    itemCount: 15,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Text('AG mortgage bank',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),),
            ),
         SizedBox(height: 2,),
          ],
        ),
      );}),


   
   
   
   
    ]
    ))));

  }
}
