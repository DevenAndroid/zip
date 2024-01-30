import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../models/model_search.dart';
import '../models/model_search_zip.dart';
import '../repository/serach_repo.dart';
import '../repository/zip_search_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class CreateRecipients extends StatefulWidget {
  const CreateRecipients({Key? key}) : super(key: key);

  @override
  State<CreateRecipients> createState() => _CreateRecipientsState();
}

class _CreateRecipientsState extends State<CreateRecipients>
    with SingleTickerProviderStateMixin {
  Rx<RxStatus> statusOfSearch = RxStatus.empty().obs;

  Rx<ModelSearchZip> searchZip = ModelSearchZip().obs;

  final profileController = Get.put(ProfileController());

  getSearchList() {
    zipSearchRepo(
      zip_tag: "${profileController.ziptag1Controller.text.trim()}@zip",
      context: context,
    ).then((value) {
      log("response.body.....    ${value}");
      searchZip.value = value;
      if (value.status == true) {
        statusOfSearch.value = RxStatus.success();
        showToast(value.message.toString());
        profileController.nameController.text =
            "${value.data!.fname.toString()} " +
                "${value.data!.lname.toString()}";
        profileController.phone1Controller.text =
            (value.data!.phone ?? "").toString();
        profileController.ziptag1Controller.text =
            (value.data!.zipTag ?? "").toString();
        profileController.zipUserController.text =
            (value.data!.id ?? "").toString();
        profileController.userId = value.data!.id.toString();

        print(value.data!.email.toString());
      } else {
        statusOfSearch.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
        // showToast(value.message.toString());
        );
  }

  late TabController _tabController;
  late String _appBarTitle;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _appBarTitle =
        'Enter your mobile number to continue'; // Set the initial title
    _tabController.addListener(_updateAppBarTitle);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateAppBarTitle() {
    setState(() {
      // Update the AppBar title based on the active tab
      switch (_tabController.index) {
        case 0:
          _appBarTitle = "Enter your mobile number to continue";
          break;
        case 1:
          _appBarTitle = 'Enter your email to continue';
          break;
      }
    });
  }

  ///
  ///
  Rx<RxStatus> statusOfSearch1 = RxStatus.empty().obs;
  TextEditingController phoneController = TextEditingController();
  Rx<ModelSearchTag> searchData = ModelSearchTag().obs;
  TextEditingController ziptagController = TextEditingController();
  TextEditingController email1Controller = TextEditingController();
  // final profileController = Get.put(ProfileController());

  getSearchList1() {
    searchRepo(
      email: email1Controller.text.trim(),
      phone: phoneController.text.trim(),
      zip_tag: "${ziptagController.text.trim()}@zip",
      context: context,
    ).then((value) {
      log("response.body.....    ${value}");
      searchData.value = value;
      if (value.status == true) {
        statusOfSearch1.value = RxStatus.success();
        showToast(value.message.toString());
        email1Controller.text = (value.data!.email ?? "").toString();
        phoneController.text = (value.data!.phone ?? "").toString();
        ziptagController.text = (value.data!.zipTag ?? "").toString();
        profileController.userId = value.data!.id.toString();

        print(value.data!.email.toString());
      } else {
        statusOfSearch1.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
        // showToast(value.message.toString());
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Send Money ",
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
          bottom: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorColor: AppTheme.secondaryColor,
            indicatorPadding: const EdgeInsets.only(left: 15, right: 10),
            labelColor: Colors.black,
            labelStyle: GoogleFonts.poppins(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.grey.withOpacity(.1),
            unselectedLabelStyle: GoogleFonts.poppins(
                color: const Color(0xFF777777),
                fontSize: 16,
                fontWeight: FontWeight.w300),
            tabs: [
              const Tab(
                text: "Add Manually",
              ),
              const Tab(
                text: "Search Zip User",
              ),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 8, left: 8),
            child: TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        "Search Zip Tag",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: CommonTextfield(
                        suffixIcon: InkWell(
                            onTap: () {
                              getSearchList();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset("assets/images/s.svg"),
                            )),
                        controller: profileController.ziptag1Controller,
                        obSecure: false,
                        hintText: "Zip Tag ",
                        labelText: "Zip Tag ",
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: CommonTextfield(
                        readOnly: true,
                        controller: profileController.nameController,
                        obSecure: false,
                        hintText: "Piyush",
                        labelText: "Name",
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: CommonTextfield(
                        readOnly: true,
                        controller: profileController.phone1Controller,
                        obSecure: false,
                        hintText: "695659606u69u06u",
                        labelText: "Phone",
                      ),
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    InkWell(
                        onTap: () {
                          profileController.nameController.text = "";
                          profileController.phone1Controller.text = "";
                          profileController.ziptag1Controller.text = "";
                        },
                        child: const CustomOutlineBoder(title: "Clear")),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.sendYourBalanceScreen);
                      },
                      child: const CustomOutlineButton(
                        title: "Continue",
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Search user by email or phone",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: CommonTextfield(
                        controller: ziptagController,
                        obSecure: false,
                        hintText: "@",
                        labelText: "ZIP Tag",
                        suffixIcon: InkWell(
                            onTap: () {
                              getSearchList1();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset("assets/images/s.svg"),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: CommonTextfield(
                        controller: email1Controller,
                        obSecure: false,
                        hintText: "Email",
                        labelText: "Enter Email",
                        suffixIcon: InkWell(
                            onTap: () {
                              getSearchList1();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset("assets/images/s.svg"),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: CommonTextfield(
                        controller: phoneController,
                        obSecure: false,
                        hintText: "Phone",
                        labelText: "Enter Phone no ",
                        suffixIcon: InkWell(
                            onTap: () {
                              getSearchList1();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset("assets/images/s.svg"),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: size.height * .17,
                    ),
                    InkWell(
                        onTap: () {
                          email1Controller.text = "";
                          phoneController.text = "";
                          ziptagController.text = "";
                        },
                        child: const CustomOutlineBoder(title: "Clear")),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.sendYourBalanceScreen);
                      },
                      child: const CustomOutlineButton(
                        title: "Continue",
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
