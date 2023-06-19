import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

class SendCash1 extends StatefulWidget {

  const SendCash1({Key? key}) : super(key: key);

  @override
  State<SendCash1> createState() => _SendCash1State();
}

class _SendCash1State extends State<SendCash1> {
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


    leading:   InkWell(

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
        "Send Cash to",
        style: GoogleFonts.poppins(
            color: const Color(0xFF1D1D1D),
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),


    ),
    bottomNavigationBar:  Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
          onTap: (){
            Get.toNamed(MyRouters.sendCash2);
          },
          child: const CustomOutlineButton(
            title: "New",
          )),
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [


      Row(
        children: [
          Expanded(
            child: InkWell(
                onTap: () {

                },
                child: const CustomOutlineButton(
                  title: "New",
                )),
          ),

          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                  // Get.toNamed(MyRouters.mobileNumber);
                },
                child: CustomOutlineBoder(
                  title: "Existing",
                  backgroundColor: Colors.white,
                  textColor: AppTheme.buttonColor,onPressed: (){
                  Get.toNamed(MyRouters.mobileNumber);
                },),
              )),
        ],
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 15, right: 30),
                child: DropdownButton(
                  value: "United Kingdom",
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/address.svg',height: 30,),
                          SizedBox(width: 10,),
                          Text(
                            "Nigeria",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      value: "United Kingdom",
                    ),
                    DropdownMenuItem(
                        child: Text("Canada"), value: "Canada"),
                    DropdownMenuItem(
                      child: Text("Russia"),
                      value: "Russia",
                    )
                  ],
                  onChanged: (value) {},
                  icon: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.keyboard_arrow_down_outlined)),
                  iconEnabledColor: Colors.black, //Icon color
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20),
                  dropdownColor: Colors.white,
                  underline: Container(),
                  isExpanded: true,
                ))),
      ),
      SizedBox(
        height: 20,
      ),
      CommonTextfield(
        obSecure: false,
        hintText: "",
        labelText: "Mobile Number",
      ),
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recipients',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF1D1D1D)),
                  ),
                ),
                Text(
                  'Select from your Recipients',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1D1D1D)),
                  ),
                ),
              ],
            ),

            Icon(Icons.search,size: 20,)
          ],
        ),
      ),
    ListView.builder(
    itemCount: 10,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
    return
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0D75F),

              ),
           child: Text(' J ',
             style: GoogleFonts.poppins(
               textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xFF2E2E2E)),
             ),),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Joanne Daniel',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF1D1D1D)),
                  ),
                ),
                Text(
                  '+234 xxxxxxxxxx',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1D1D1D)),
                  ),
                ),
              ],
            ),


          ],
        ),
    );} ),

    ]
    )))
    );
  }
}
