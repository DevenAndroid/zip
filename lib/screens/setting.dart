import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/transfer_limit.dart';
import 'package:zip/widgets/common_colour.dart';



class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: AppTheme.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 29,top: 33),
              child: Text(
                "Notifications",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 35,),

            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Notification Setting ",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
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
            Padding(
              padding: const EdgeInsets.only(left: 29,top: 11),
              child: Text(
                "Privacy & Settings",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Manage Devices",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Control which devices have access to your account",
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
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hide Balance",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Hide your balance on the home screen",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

                CupertinoSwitch(
                  value: isSwitched,
                  activeColor: Color(0xffF0D75F),
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                ),
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
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enable Security Lock",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Will require your PIN when you close the app",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

                CupertinoSwitch(
                  value: isSwitched,
                  activeColor: Color(0xffF0D75F),
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                ),
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
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction PIN",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Will rewuire your PIN before each transection",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

                CupertinoSwitch(
                  value: isSwitched,
                  activeColor: Color(0xffF0D75F),
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                ),
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
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enable Fingerprints",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Control which devices have access to your account",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),

                CupertinoSwitch(
                  value: isSwitched,
                  activeColor: Color(0xffF0D75F),
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                ),
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
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Change ZIP PIN",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "CChange your ZIP PIN and set new one",
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
            Padding(
              padding: const EdgeInsets.only(left: 29,top: 11),
              child: Text(
                "Feedback",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Rate the App",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
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
      Padding(
        padding: const EdgeInsets.only(left: 29),
        child: InkWell(
          onTap: (){
            Get.to(Transferlimit());
          },
          child: Text(
            "Sign Out",
            style: GoogleFonts.poppins(
                color: const Color(0xFFF0D75F),
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),

          ],
        ),
      ),
    );
  }
  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
}
