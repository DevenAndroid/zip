import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/profile_screen.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';
import 'mycard.dart';

class PayBillsServices extends StatefulWidget {
  const PayBillsServices({Key? key}) : super(key: key);

  @override
  State<PayBillsServices> createState() => _PayBillsServicesState();
}

class _PayBillsServicesState extends State<PayBillsServices> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Pay Bills",
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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                obSecure: false,
                hintText: "Saving Account General",
                labelText: "Source account",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(

                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: const CustomOutlineButton(
                          title: "Saved Bill",
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      showModalBottomSheet

                        (
                      shape: CircleBorder(),


                          context: context,
                          builder: (context) {
                            return Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(21),
                                        topRight: Radius.circular(21))),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 5,
                                          width: 37,
                                          color: const Color(0xffD9D9D9),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 22,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, bottom: 7),
                                        child: Text(
                                          "Category",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1C1C1C),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 6, right: 6, bottom: 38),
                                        child: CommonTextfield(
                                          prefix: const Icon(Icons.search),
                                          obSecure: false,
                                          hintText: "Search",
                                          labelText: "",
                                        ),
                                      ),
                                       ListView.builder(
                                         itemCount: 4,
                                           shrinkWrap: true,
                                           itemBuilder: (context,index){
                                         return  Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                         Padding(
                                         padding: const EdgeInsets.only(left: 31,top: 15),
                                         child: Text(
                                         "Aids and grant",
                                         style: GoogleFonts.poppins(
                                         color: const Color(0xFF1D1D1D),
                                         fontSize: 13,
                                         fontWeight: FontWeight.w500),
                                         ),
                                         ),
                                         const SizedBox(
                                         height: 11,
                                         ),
                                         const Divider(
                                         thickness: 1,
                                         color: Color(0x1a000000),
                                         ),
                                         ]
                                         );
                                       })

                                    ],
                                  ),
                                ));
                          });
                    },
                    child: CustomOutlineBoder(
                      title: "Add Bill",
                      backgroundColor: Colors.white,
                      textColor: AppTheme.buttonColor,
                      onPressed: () {},
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                obSecure: false,
                hintText: "Saved Bill",
                labelText: "Bill Name",
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(

                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Schedule payment",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    "Now",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.arrow_forward_ios,size: 20,),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(

                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Schedule payment",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    "Now",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.arrow_forward_ios,size: 20,),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(

                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Schedule payment",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    "Now",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.arrow_forward_ios,size: 20,),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(

                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Save to my shortcut",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: SizedBox(
                      width: 50,
                      height: 20,
                      child: CupertinoSwitch(
                        thumbColor: Colors.black,


                        value: isSwitched,
                        activeColor: const Color(0xffF0D75F),

                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .2,
            ),
            InkWell(
              onTap: () {
Get.toNamed(MyRouters.bottomNavbar);
              },
              child: const CustomOutlineButton(
                title: "Confirm",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
