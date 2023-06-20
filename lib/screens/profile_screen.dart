import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset("assets/images/link.png",),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding:
                  const EdgeInsets.all(
                      2),
                  decoration:
                  const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                      right:
                      size.width * .01,
                      left: size.width *
                          .015),
                  child: CircleAvatar(
                    radius:
                    size.height * .07,
                    backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/128-1284293_marina-circle-girl-picture-in-circle-png-transparent.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: Container(
                        padding:
                        const EdgeInsets.all(
                            5),
                        decoration:
                         BoxDecoration(
                            color: Color(
                                0xffF0D75F),
                           borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size:
                          size.height * .015,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Daniel Daniel",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "@danieldan",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Current Balance",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "\$276.00",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),

              ],
            ),
            SizedBox(height: 23,),
            Divider(
              thickness: 5,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.addAPayer);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Cash",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Transfer cash from your bank into ZIP",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),

                 Icon(Icons.arrow_forward_ios,size: 15,),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.yourBalanceScreen);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash Out",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Transfer cash from ZIP into your",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),

                 Icon(Icons.arrow_forward_ios,size: 15,),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check Rates",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "See current foreign exchange rates",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

               Icon(Icons.arrow_forward_ios,size: 15,),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 5,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.buyServices);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Buy Airtime",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Buy discounted airtime with your ZIP balance",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),

                  Text(
                    "2% OFF",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF0FA657),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),

                 Icon(Icons.arrow_forward_ios,size: 15,),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.payBillsServices);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pay Bills",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Pay your bills with your ZIP balance",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),

                 Icon(Icons.arrow_forward_ios,size: 15,),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connected Merchants",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "See current foreign exchange rates",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

               Icon(Icons.arrow_forward_ios,size: 15,),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 5,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Sign into your account using multiple  phone numbers \n and emails",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

               Icon(Icons.arrow_forward_ios,size: 15,),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Methods",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Add multiple card and bank accounts",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

               Icon(Icons.arrow_forward_ios,size: 15,),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.transferLimit);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transfer Limits",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Check Money transfer limits",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),

                 Icon(Icons.arrow_forward_ios,size: 15,),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.setting);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Control your notification and security settings",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),

                 Icon(Icons.arrow_forward_ios,size: 15,),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
         SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }
}
