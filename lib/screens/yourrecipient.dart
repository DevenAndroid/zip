import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/payout_controller.dart';
import '../models/model_beneficary_list.dart';
import '../models/model_favorite_benificery.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class YourRecipient extends StatefulWidget {
  const YourRecipient({Key? key}) : super(key: key);

  @override
  State<YourRecipient> createState() => _YourRecipientState();
}

class _YourRecipientState extends State<YourRecipient>
    with SingleTickerProviderStateMixin {
  final payoutController = Get.put(PayoutController());
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchController1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    payoutController.getDataList1();
    payoutController.getDataList2();
    _tabController = TabController(length: 3, vsync: this);
    _appBarTitle = 'Beneficiaries'; // Set the initial title
    _tabController.addListener(_updateAppBarTitle);
  }

  late TabController _tabController;
  late String _appBarTitle;

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
          _appBarTitle = "Beneficiaries";
          break;
        case 1:
          _appBarTitle = 'Favourite Beneficiaries';
          break;
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
            _appBarTitle,
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
            tabs: const [
              Tab(
                text: "Add Manually",
              ),
              Tab(
                text: "Favourite",
              ),
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          RefreshIndicator(
            color: Colors.white,
            backgroundColor: AppTheme.primaryColor,
            onRefresh: () async {
              payoutController.getDataList1();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 12),
                    child: Text(
                      "Your Recipients",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: CommonTextfield(
                      obSecure: false,
                      hintText: "Search",
                      controller: searchController,
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: const Icon(Icons.search)),
                      onChanged: (gt) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    List<BenificaryData> data = [];
                    if (payoutController
                            .statusOfListBenificery.value.isSuccess &&
                        payoutController.listBenificery.value.data != null) {
                      String search =
                          searchController.text.trim().toLowerCase();
                      if (search.isNotEmpty) {
                        data = payoutController.listBenificery.value.data!
                            .where((element) =>
                                element.firstName
                                    .toString()
                                    .toLowerCase()
                                    .contains(search) ||
                                element.accountHolderName
                                    .toString()
                                    .toLowerCase()
                                    .contains(search) ||
                                element.bankName
                                    .toString()
                                    .toLowerCase()
                                    .contains(search) ||
                                element.destinationAddress
                                    .toString()
                                    .toLowerCase()
                                    .contains(search))
                            .toList();
                      } else {
                        data = payoutController.listBenificery.value.data!;
                      }
                    }
                    return payoutController
                            .statusOfListBenificery.value.isSuccess
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = data[index];
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      SharedPreferences pref =
                                          await SharedPreferences.getInstance();
                                      if (pref.getBool('TransistionPin') ==
                                          true) {
                                        Get.toNamed(MyRouters.beneficeryPin,
                                            arguments: item);
                                      } else {
                                        Get.toNamed(
                                          MyRouters.payNowBalance,
                                          arguments: item,
                                        );
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 17,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          maxRadius: 25,
                                          child: Text(
                                            item.firstName!
                                                .toString()
                                                .substring(0, 1),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item.firstName!.toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff1D1D1D),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              'ZIP',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xffB2B2B2),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.0, top: 16),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey.withOpacity(.3),
                                    ),
                                  )
                                ],
                              );
                            })
                        : payoutController.statusOfListBenificery.value.isError
                            ? CommonErrorWidget(
                                errorText: payoutController
                                    .listBenificery.value.message
                                    .toString(),
                                onTap: () {
                                  payoutController.getDataList1();
                                },
                              )
                            : const CommonProgressIndicator();
                  })
                ],
              ),
            ),
          ),
          RefreshIndicator(
            color: Colors.white,
            backgroundColor: AppTheme.primaryColor,
            onRefresh: () async {
              payoutController.getDataList2();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 12),
                    child: Text(
                      "Your Recipients",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: CommonTextfield(
                      obSecure: false,
                      hintText: "Search",
                      controller: searchController,
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: const Icon(Icons.search)),
                      onChanged: (gt) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    List<favouriteData> data = [];
                    if (payoutController
                            .statusOfListFavouriteBenificery.value.isSuccess &&
                        payoutController.listFavouriteBenificery.value.data !=
                            null) {
                      String search =
                          searchController1.text.trim().toLowerCase();
                      if (search.isNotEmpty) {
                        data = payoutController
                            .listFavouriteBenificery.value.data!
                            .where((element) =>
                                element.firstName
                                    .toString()
                                    .toLowerCase()
                                    .contains(search) ||
                                element.accountHolderName
                                    .toString()
                                    .toLowerCase()
                                    .contains(search) ||
                                element.bankName
                                    .toString()
                                    .toLowerCase()
                                    .contains(search) ||
                                element.destinationAddress
                                    .toString()
                                    .toLowerCase()
                                    .contains(search))
                            .toList();
                      } else {
                        data = payoutController
                            .listFavouriteBenificery.value.data!;
                      }
                    }
                    return payoutController
                            .statusOfListFavouriteBenificery.value.isSuccess
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = data[index];
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Get.toNamed(MyRouters.favourateBalance,
                                          arguments: item);
                                      // SharedPreferences pref =
                                      // await SharedPreferences.getInstance();
                                      // if (pref.getBool('TransistionPin') == true) {
                                      //   Get.toNamed(MyRouters.beneficeryPin,
                                      //       arguments: item);
                                      // } else {
                                      //   Get.toNamed(
                                      //     MyRouters.payNowBalance,
                                      //     arguments: item,
                                      //   );
                                      // }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 17,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          maxRadius: 25,
                                          child: Text(
                                            item.firstName!
                                                .toString()
                                                .substring(0, 1),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item.firstName!.toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff1D1D1D),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              'ZIP',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xffB2B2B2),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.0, top: 16),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey.withOpacity(.3),
                                    ),
                                  ),
                                ],
                              );
                            })
                        : payoutController
                                .statusOfListFavouriteBenificery.value.isError
                            ? CommonErrorWidget(
                                errorText: payoutController
                                    .listFavouriteBenificery.value.message
                                    .toString(),
                                onTap: () {
                                  payoutController.getDataList2();
                                },
                              )
                            : const CommonProgressIndicator();
                  })
                ],
              ),
            ),
          )
        ]));
  }
}
