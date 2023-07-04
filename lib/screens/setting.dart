import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/repository/setting_repo.dart';
import 'package:zip/repository/updatesetting_repo.dart';
import 'package:zip/screens/transfer_limit.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/setting_modal.dart';
import '../models/update_setting_modal.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  Rx<SettingModal> modal = SettingModal().obs;
  Rx<UpdateSettingModal> login = UpdateSettingModal().obs;
  Rx<RxStatus> statusOflogin = RxStatus.empty().obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }
  updateSetting() {
    updateSettingRepo(
          context: context,
          hide_balance: modal.value.data!.hideBalance! ? "1":"0",
          enable_fingerprints: modal.value.data!.enableFingerprints! ? "1":"0",
      enable_security_lock: modal.value.data!.enableSecurityLock! ? "1":"0",
      transaction_pin: modal.value.data!.transactionPin! ? "1":"0",

      ).then((value) {
        login.value = value;
        if (value.status == true) {
          statusOflogin.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOflogin.value = RxStatus.error();
          showToast(value.message.toString());


        }
      }

      );
    }



  getData() {
    settingRepo().then((value) {
      modal.value = value;
      if (value.status == true) {
        print(value.message.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Setting",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),

      ),
      body: Obx(() {
        return modal.value.status==true?
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 29, top: 33),
                child: Text(
                  "Notifications",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 35,),

              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: ()  async {
                      print("object");

                        //   SharedPreferences pref = await SharedPreferences.getInstance();
                        // print(pref.getString("cookie")!.toString().replaceAll('\"', ''));
                     },
                    child: Text(
                      "Notification Setting ",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Spacer(),

                  const Icon(Icons.arrow_forward_ios, size: 15,),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 5,
                color: Color(0x1A000000),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29, top: 11),
                child: Text(
                  "Privacy & Settings",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const SizedBox(
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
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 15,),

                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const SizedBox(
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
                  const Spacer(),

                  CupertinoSwitch(
                    value: modal.value.data!.hideBalance!,
                    activeColor: const Color(0xffF0D75F),
                    onChanged: (value) {
                      setState(() {
                        modal.value.data!.hideBalance = value;
                       updateSetting();
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const SizedBox(
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
                  const Spacer(),

                  CupertinoSwitch(
                    value: modal.value.data!.enableSecurityLock!,
                    activeColor: const Color(0xffF0D75F),
                    onChanged: (value) {
                      setState(() {
                        modal.value.data!.enableSecurityLock = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const SizedBox(
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
                  const Spacer(),

                  CupertinoSwitch(
                    value: modal.value.data!.transactionPin!,
                    activeColor: const Color(0xffF0D75F),
                    onChanged: (value) {
                      setState(() {
                        modal.value.data!.transactionPin = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const SizedBox(
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
                  const Spacer(),

                  CupertinoSwitch(
                    value: modal.value.data!.enableFingerprints!,
                    activeColor: const Color(0xffF0D75F),
                    onChanged: (value) {
                      setState(() {
                        modal.value.data!.enableFingerprints = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.sendOtpForPinScreen);
                },
                child: Row(
                  children: [
                    const SizedBox(
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
                          "Change your ZIP PIN and set new one",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 9,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 15,),

                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 5,
                color: Color(0x1A000000),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29, top: 11),
                child: Text(
                  "Feedback",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Rate the App",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),

                  const Spacer(),

                  const Icon(Icons.arrow_forward_ios, size: 15,),

                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 5,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 29),
                child: InkWell(
                  onTap: () {
                    Get.to(const Transferlimit());
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
              const SizedBox(height: 30,),
            ],
          ),
        ):Center(child: CircularProgressIndicator(),);
      }),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    }
    else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
}
