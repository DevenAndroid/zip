import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';
class ExchangeMoney extends StatefulWidget {
  const ExchangeMoney({Key? key}) : super(key: key);

  @override
  State<ExchangeMoney> createState() => _ExchangeMoneyState();
}

class _ExchangeMoneyState extends State<ExchangeMoney> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
    appBar: AppBar(
    leading: InkWell(
    onTap: () {
    Get.back();
    },
    child: const Icon(
    Icons.arrow_back_rounded,
    color: AppTheme.primaryColor,
    ),
    ),
    title: Text(
    "Exchange Moeney",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),

    centerTitle: true,
    ),
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
      Container(
        decoration: BoxDecoration(
            border:
            Border.all(color: AppTheme.primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                color: Color(0xFFEEEEEE)
              ),
              child: const CountryCodePicker(
                onChanged: print,
                initialSelection: 'IT',
                favorite: ['+39', 'FR'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: true,
                alignLeft: false,
              ),
            ),

            SizedBox(
              width: 120,
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "You pay            0",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 16,
                        decorationColor: Colors.transparent,
                        decorationThickness: 0,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: SizedBox(
                width: 10,
                height: 50,
                child: DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,

                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,

                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,

                  dashGapRadius: 0.0,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0D75F),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.clear,size: 18,),
                ),
                SizedBox(width: 10,),
                Text("\$1 =  N745",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF7E7E7E),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: SizedBox(
                width: 10,
                height: 50,
                child: DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,

                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,

                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,

                  dashGapRadius: 0.0,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0D75F),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(" - ",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),),
                  ),
                ),
                SizedBox(width: 10,),
                Text("Fee =  \$0.00",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF7E7E7E),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: SizedBox(
                width: 10,
                height: 50,
                child: DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,

                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,

                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,

                  dashGapRadius: 0.0,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0D75F),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/images/Vector.svg",height: 20,)
                ),
                SizedBox(width: 10,),
                Text("Instant",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF7E7E7E),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: SizedBox(

                height: 45,
                child: DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,

                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,

                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,

                  dashGapRadius: 0.0,
                ),
              ),
            ),
          ],
        ),
      ),

      SizedBox(height: 2,),
      Container(
        decoration: BoxDecoration(
            border:
            Border.all(color: AppTheme.primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                color: Color(0xFFEEEEEE)
              ),
              child: const CountryCodePicker(
                onChanged: print,
                initialSelection: 'IT',
                favorite: ['+39', 'FR'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: true,
                alignLeft: false,
              ),
            ),

            SizedBox(
              width: 120,
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "You Get            0",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 16,
                        decorationColor: Colors.transparent,
                        decorationThickness: 0,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),


   ] ))));
  }
}

