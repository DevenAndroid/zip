import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/repository/setting_repo.dart';
import 'package:zip/repository/updatesetting_repo.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/delete_model.dart';
import '../models/model_signout.dart';
import '../models/setting_modal.dart';
import '../models/update_setting_modal.dart';
import '../repository/delete_user_repo.dart';
import '../repository/signout_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import '../widgets/common_button.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Rx<SettingModal> modalGetSetting = SettingModal().obs;
  bool isSwitched = false;

  getData() {
    settingRepo().then((value) {
      modalGetSetting.value = value;
      if (value.status == true) {}
    });
  }

  Rx<RxStatus> statusOfsignout = RxStatus.empty().obs;
  Rx<ModelSignout> signout = ModelSignout().obs;

  signOut() {
    signoutRepo(context).then((value) async {
      signout.value = value;
      if (value.status == true) {
        statusOfsignout.value = RxStatus.success();
        SharedPreferences pref = await SharedPreferences.getInstance();
        Get.offAllNamed(MyRouters.onBoardingScreen);
        pref.clear();
        showToast(value.message.toString());
      } else {
        statusOfsignout.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
        // showToast(value.message.toString());
        );
  }

  Rx<RxStatus> statusOfdelete = RxStatus.empty().obs;
  Rx<ModelDelete> delete = ModelDelete().obs;

  deleteAccount() {
    deleteRepo(context).then((value) async {
      delete.value = value;
      if (value.status == true) {
        statusOfdelete.value = RxStatus.success();
        SharedPreferences pref = await SharedPreferences.getInstance();
        Get.offAllNamed(MyRouters.onBoardingScreen);
        pref.clear();
        showToast(value.message.toString());
      } else {
        statusOfdelete.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
        // showToast(value.message.toString());
        );
  }

  Rx<UpdateSettingModal> login = UpdateSettingModal().obs;
  Rx<RxStatus> statusOflogin = RxStatus.empty().obs;

  updateSetting() {
    updateSettingRepo(
      context: context,
      hide_balance: modalGetSetting.value.data!.hideBalance! ? "1" : "0",
      enable_fingerprints:
          modalGetSetting.value.data!.enableFingerprints! ? "1" : "0",
      enable_security_lock:
          modalGetSetting.value.data!.enableSecurityLock! ? "1" : "0",
      transaction_pin: modalGetSetting.value.data!.transactionPin! ? "1" : "0",
    ).then((value) async {
      login.value = value;
      if (value.status == true) {
        statusOflogin.value = RxStatus.success();
        showToast(value.message.toString());
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('TransistionPin', value.data!.transactionPin!);
        pref.setBool('HideBalance', value.data!.hideBalance!);
      } else {
        statusOflogin.value = RxStatus.error();
        showToast(value.message.toString());
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('TransistionPin', value.data!.transactionPin!);
        pref.setBool('HideBalance', value.data!.hideBalance!);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> canAuthenticate() async =>
      await _localAuthentication.canCheckBiometrics ||
      await _localAuthentication.isDeviceSupported();

  Future<void> authenticate() async {
    if (await _localAuthentication.canCheckBiometrics &&
        await _localAuthentication.isDeviceSupported()) {
      bool authenticated = false;

      try {
        authenticated = await _localAuthentication.authenticate(
            localizedReason: 'Please authenticate to access the app.',
            options: const AuthenticationOptions(
                biometricOnly: true,
                useErrorDialogs: true,
                stickyAuth: true,
                sensitiveTransaction: true));
      } catch (e) {
        // Handle any exceptions that occur during the authentication process.
      }

      if (authenticated) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        // logINRepo(
        //     email: pref.getString("email"),
        //     password: pref.getString("password"),
        //     context: context)
        //     .then((value) async {
        //   if (value.status == true) {
        //     SharedPreferences pref = await SharedPreferences.getInstance();
        //     pref.setString("userData", jsonEncode(value));
        //     showToast("Login successful");
        //     Get.offAllNamed(MyRouter.bottomBar);
        //   } else {
        //     showToast(value.errors!.message.toString());
        //     print(value.toString());
        //   }
        // });
      }
    } else {
      showToast("Please enable your biometric");
    }
  }

  SetValues(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value == true) {
      pref.setBool('Enabel', true);
    } else {
      pref.setBool('Enabel', false);
    }
  }

  transistionPin(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value == true) {
      pref.setBool('TransistionPin', true);
    } else {
      pref.setBool('TransistionPin', false);
    }
  }

  fingerPrint(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value == true) {
      pref.setBool('finger', true);
    } else {
      pref.setBool('finger', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: InkWell(
          onTap: () {},
          child: Text(
            "Settings",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
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
        return modalGetSetting.value.status == true
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 29),
                      child: Text(
                        "Notifications",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.notificationScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.5,
                                    0.5,
                                  ), //Offset
                                  blurRadius: 0.5,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ]),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(MyRouters.notificationScreen);
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    //   SharedPreferences pref = await SharedPreferences.getInstance();
                                    // print(pref.getString("cookie")!.toString().replaceAll('\"', ''));
                                  },
                                  child: Text(
                                    "Notification Settings ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 11),
                      child: Text(
                        "Privacy & Settings",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.5,
                                  0.5,
                                ), //Offset
                                blurRadius: 0.5,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                ),
                                CupertinoSwitch(
                                  value:
                                      modalGetSetting.value.data!.hideBalance!,
                                  activeColor: const Color(0xffF0D75F),
                                  onChanged: (value) {
                                    setState(() {
                                      modalGetSetting.value.data!.hideBalance =
                                          value;
                                      updateSetting();
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0x1A000000),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                        },
                                        child: Text(
                                          "Enable Security Lock",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
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
                                ),
                                // const Spacer(),
                                CupertinoSwitch(
                                  value: modalGetSetting
                                      .value.data!.enableSecurityLock!,
                                  activeColor: const Color(0xffF0D75F),
                                  onChanged: (value) {
                                    setState(() {
                                      modalGetSetting.value.data!
                                          .enableSecurityLock = value;
                                      updateSetting();
                                      SetValues(value);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0x1A000000),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                        },
                                        child: Text(
                                          "Transaction PIN",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Text(
                                        "Will require your PIN before each transaction",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF1D1D1D),
                                            fontSize: 9,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                CupertinoSwitch(
                                  value: modalGetSetting
                                      .value.data!.transactionPin!,
                                  activeColor: const Color(0xffF0D75F),
                                  onChanged: (value) {
                                    setState(() {
                                      modalGetSetting
                                          .value.data!.transactionPin = value;
                                      updateSetting();
                                      // transistionPin(value);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0x1A000000),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Enable Fingerprints",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF1D1D1D),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          authenticate();
                                        },
                                        child: Text(
                                          "Control which devices have access to your account",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 9,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CupertinoSwitch(
                                  value: modalGetSetting
                                      .value.data!.enableFingerprints!,
                                  activeColor: const Color(0xffF0D75F),
                                  onChanged: (value) {
                                    setState(() {
                                      modalGetSetting.value.data!
                                          .enableFingerprints = value;
                                      updateSetting();
                                      fingerPrint(value);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0x1A000000),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(MyRouters.sendOtpForPinScreen);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 11),
                      child: Text(
                        "Feedback",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(MyRouters.notificationScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.5,
                                    0.5,
                                  ), //Offset
                                  blurRadius: 0.5,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ]),
                          child: Row(
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
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 11),
                      child: Text(
                        "Exit",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.5,
                                    0.5,
                                  ), //Offset
                                  blurRadius: 0.5,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ]),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      icon: Icon(
                                        Icons.exit_to_app,
                                        color: Colors.black,
                                        size: 50,
                                      ),
                                      title: const Text(
                                        "Logout!",
                                        style: TextStyle(
                                            fontFamily: "Graphite",
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF262E39),
                                            fontSize: 26),
                                      ),
                                      content: const Text(
                                        "You want to logout from app ",
                                        style: TextStyle(
                                            fontFamily: "Graphite",
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF262E39),
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: CustomOutlineButton(
                                                  title: "No",
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              SizedBox(
                                                width: 100,
                                                child: CustomOutlineButton(
                                                  title: "Yes",
                                                  onPressed: () {
                                                    signOut();
                                                    // Get.to(() => BottomNavbar());
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
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
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.5,
                                    0.5,
                                  ), //Offset
                                  blurRadius: 0.5,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                      size: 50,
                                    ),
                                    title: const Text(
                                      "Delete !",
                                      style: TextStyle(
                                          fontFamily: "Graphite",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF262E39),
                                          fontSize: 26),
                                    ),
                                    content: const Text(
                                      "You want to delete account",
                                      style: TextStyle(
                                          fontFamily: "Graphite",
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF262E39),
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: CustomOutlineButton(
                                                title: "No",
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: CustomOutlineButton(
                                                title: "Yes",
                                                onPressed: () {
                                                  deleteAccount();
                                                  // Get.to(() => BottomNavbar());
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Delete Account",
                                    style: GoogleFonts.poppins(
                                        color: Colors.red,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}
